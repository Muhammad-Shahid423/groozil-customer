import 'package:dio/dio.dart';
import 'package:groozil_app/core/network/models/api_response.dart';
import 'package:groozil_app/core/network/response_code.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResponseHandler {
  /// Processes and validates API responses
  Future<void> handleResponse(
      Response<dynamic> response,
      ResponseInterceptorHandler handler,
      ) async {
    try {
      final responseData = await _extractResponseData(response);
      final baseResponse = _parseBaseResponse(responseData);
      final responseCode = baseResponse.statusCode;

      if (_isAuthenticationFailed(responseCode)) {
        _rejectWithAuthFailure(response, baseResponse, handler);
        return;
      }

      if (_isSuccessResponse(responseCode, baseResponse)) {
        _handleSuccessResponse(response, baseResponse, handler);
        return;
      }

      _rejectWithApiError(response, baseResponse, handler);
    } on Exception catch (e) {
      _rejectWithParseError(response, e, handler);
    }
  }

  bool _isAuthenticationFailed(int? responseCode) {
    return responseCode == ResponseCode.unAuthorized;
  }

  bool _isSuccessResponse(int? responseCode, ApiResponse<dynamic> baseResponse) {
    const successCodes = [
      ResponseCode.success,
      ResponseCode.accepted,
      ResponseCode.created,
    ];
    // Success is determined by status code AND the success flag
    // Data can be null for successful operations like OTP sent
    return successCodes.contains(responseCode) && 
           (baseResponse.success ?? false);
  }

  Future<dynamic> _extractResponseData(Response<dynamic> response) async {
    // return response.data;
    //  if (response.requestOptions.responseType == ResponseType.bytes) {
    //   final decoded = await ApiUtils.bytesToString(bytes: response.data);
    //   return json.decode(decoded);
    // }
    return response.data;
  }
  
  ApiResponse<dynamic> _parseBaseResponse(dynamic responseData) {
    return ApiResponse.fromJson(responseData as Map<String, dynamic>, (json) => json);
  }

  void _handleSuccessResponse(
      Response<dynamic> response,
      ApiResponse<dynamic> baseResponse,
      ResponseInterceptorHandler handler,
      ) {
    handler.next(response);
  }

  void _rejectWithAuthFailure(
      Response<dynamic> response,
      ApiResponse<dynamic> baseResponse,
      ResponseInterceptorHandler handler,
      ) {
    handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.cancel,
        error: baseResponse.message ?? 'Unauthorized!',
      ),
      true
    );
  }

  void _rejectWithApiError(
      Response<dynamic> response,
      ApiResponse<dynamic> baseResponse,
      ResponseInterceptorHandler handler,
      ) {
    // Prioritize message field, then errors array, then generic message
    final errorMessage = baseResponse.message ?? 
                        baseResponse.errors?.join(', ') ?? 
                        baseResponse.error ?? 
                        'An error occurred';
    
    handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: errorMessage,
      ),
      true
    );
  }

  void _rejectWithParseError(
      Response<dynamic> response,
      Object error,
      ResponseInterceptorHandler handler,
      ) {
    handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: 'Response parsing error: $error',
      ),
      true,
    );
  }
}
