import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:groozil_app/core/errors/exceptions.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;

    if (response != null) {
      final statusCode = response.statusCode ?? 0;
      final data = response.data;

      // Extract error message
      var message = 'An error occurred';
      List<String>? errors;

      if (data is Map<String, dynamic>) {
        message = data['message'] as String? ?? message;
        errors = (data['errors'] as List<dynamic>?)?.cast<String>();
      }

      debugPrint('🔴 Error Interceptor - Status: $statusCode, Message: $message');
      if (errors != null && errors.isNotEmpty) {
        debugPrint('🔴 Validation Errors: ${errors.join(', ')}');
      }

      // Convert DioException to custom exceptions based on status code
      Exception customException;

      switch (statusCode) {
        case 400:
          customException = ValidationException(message);
        case 401:
          customException = AuthException(message);
        case 403:
          customException = AuthException('Access forbidden');
        case 404:
          customException = NotFoundException(message);
        case 422:
          customException = ValidationException(
            errors?.isNotEmpty ?? false ? errors!.join(', ') : message,
          );
        case 429:
          customException = ServerException('Too many requests. Please try again later.');
        case 500:
        case 502:
        case 503:
          customException = ServerException(message);
        default:
          customException = ServerException(message);
      }

      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: customException,
          response: response,
          type: err.type,
        ),
      );
    }

    // Handle network errors
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: NetworkException('No internet connection. Please check your network.'),
          type: err.type,
        ),
      );
    }

    return handler.next(err);
  }
}
