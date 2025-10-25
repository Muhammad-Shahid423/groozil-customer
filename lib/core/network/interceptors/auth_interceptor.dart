import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:groozil_app/core/constants/app_constants.dart';
import 'package:groozil_app/core/network/api_constants.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/services/storage/storage_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {

  AuthInterceptor(this._storageService);

  final StorageService _storageService;

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
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    // Handle 401 Unauthorized - Token expired
    if (err.response?.statusCode == 401) {
      final refreshToken = _storageService.getRefreshToken();

      if (refreshToken != null && refreshToken.isNotEmpty) {
        // Try to refresh token
        final newToken = await _refreshToken(refreshToken);

        if (newToken != null) {
          // Update token in storage

          await _storageService.setAccessToken(newToken);

          // Retry the original request with new token
          final requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $newToken';

          try {
            final response = await Dio().fetch(requestOptions);
            return handler.resolve(response);
          } on DioException catch (e) {
            debugPrint('🔴 Retry request failed: $e');
          }
        }
      }

      // If refresh fails, clear tokens and redirect to login
      await _clearAuthData();
      NavigationService.goToLogin();
    }

    return handler.next(err);
  }

  Future<String?> _refreshToken(String refreshToken) async {
    try {
      final dio = Dio(
        BaseOptions(baseUrl: ApiConstants.apiBaseUrl),
      );

      final response = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final apiData = data['data'] as Map<String, dynamic>?;

        final newAccessToken = apiData?['accessToken'] as String?;
        final newRefreshToken = apiData?['refreshToken'] as String?;

        if (newRefreshToken != null) {
          await _storageService.setRefreshToken(newRefreshToken);
        }

        return newAccessToken;
      }
    } on DioException catch (e) {
      debugPrint('🔴 Token refresh failed: $e');
    }
    return null;
  }

  Future<void> _clearAuthData() async {
    await _storageService.clearAll();
  }
}
