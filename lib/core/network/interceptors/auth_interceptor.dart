import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:groozil_app/core/constants/app_constants.dart';
import 'package:groozil_app/core/network/api_constants.dart';
import 'package:groozil_app/core/network/handlers/response_handler.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/services/storage/storage_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {

  AuthInterceptor(this._storageService, this._responseHandler);

  final StorageService _storageService;
  final ResponseHandler _responseHandler;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = _storageService.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Add request metadata
    final requestId = DateTime.now().millisecondsSinceEpoch.toString();
    options.headers['X-Request-ID'] = requestId;
    options.headers['X-Platform'] = 'mobile';
    options.headers['X-App-Version'] = AppConstants.appVersion;
    options.headers['X-Device-Type'] = defaultTargetPlatform.name;

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    await _responseHandler.handleResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    // Handle 401 Unauthorized - Token expired
    if (err.response?.statusCode == 401) {
      final requestPath = err.requestOptions.path;
      
      debugPrint('⚠️ 401 Unauthorized on: $requestPath');
      
      // Don't auto-redirect for OTP verification or initial auth endpoints
      // Let the UI handle these errors with proper feedback
      if (_isAuthRelatedEndpoint(requestPath)) {
        debugPrint('🔐 Auth-related endpoint, skipping token refresh');
        return handler.next(err);
      }

      final refreshToken = _storageService.getRefreshToken();

      if (refreshToken != null && refreshToken.isNotEmpty) {
        debugPrint('🔄 Found refresh token, attempting refresh...');
        
        // Try to refresh token
        final newToken = await _refreshToken(refreshToken);

        if (newToken != null) {
          debugPrint('✅ Token refresh successful, retrying original request');
          
          // Update token in storage
          await _storageService.setAccessToken(newToken);

          // Retry the original request with new token
          final requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $newToken';

          try {
            final response = await Dio().fetch<dynamic>(requestOptions);
            debugPrint('✅ Original request succeeded after token refresh');
            return handler.resolve(response);
          } on DioException catch (e) {
            debugPrint('🔴 Retry request failed after token refresh: ${e.message}');
          }
        } else {
          debugPrint('🔴 Token refresh returned null');
        }
      } else {
        debugPrint('🔴 No refresh token available');
      }

      // If refresh fails, clear tokens and redirect to login
      debugPrint('🚪 Clearing auth data and redirecting to login');
      await _clearAuthData();
      NavigationService.goToAuthOptions();
    }

    return handler.next(err);
  }

  Future<String?> _refreshToken(String refreshToken) async {
    try {
      debugPrint('🔄 Attempting to refresh token...');
      
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final response = await dio.post<Map<String, dynamic>>(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      debugPrint('🔄 Refresh response status: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        
        if (data == null) {
          debugPrint('🔴 Refresh failed: Response data is null');
          return null;
        }

        // Handle ApiResponse format: { success, data, message }
        final apiData = data['data'] as Map<String, dynamic>?;
        
        if (apiData == null) {
          debugPrint('🔴 Refresh failed: data field is null');
          return null;
        }

        final newAccessToken = apiData['accessToken'] as String?;
        final newRefreshToken = apiData['refreshToken'] as String?;

        if (newAccessToken == null) {
          debugPrint('🔴 Refresh failed: accessToken is null');
          return null;
        }

        debugPrint('✅ Token refreshed successfully');

        // Update refresh token if provided
        if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
          await _storageService.setRefreshToken(newRefreshToken);
          debugPrint('✅ Refresh token updated');
        }

        return newAccessToken;
      }
      
      debugPrint('🔴 Refresh failed: Invalid status code ${response.statusCode}');
    } on DioException catch (e) {
      debugPrint('🔴 Token refresh failed: ${e.message}');
      debugPrint('🔴 Response: ${e.response?.data}');
    } catch (e) {
      debugPrint('🔴 Token refresh error: $e');
    }
    return null;
  }

  Future<void> _clearAuthData() async {
    await _storageService.clearAll();
  }

  /// Checks if the endpoint is related to authentication flow
  /// where we shouldn't auto-redirect on 401 errors
  bool _isAuthRelatedEndpoint(String path) {
    const authEndpoints = [
      ApiConstants.sendOtp,
      ApiConstants.verifyOtp,
      ApiConstants.googleAuth,
      ApiConstants.appleAuth,
      ApiConstants.refreshToken,
    ];
    
    return authEndpoints.any((endpoint) => path.contains(endpoint));
  }
}
