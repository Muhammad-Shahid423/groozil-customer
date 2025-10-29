import 'dart:io';
import 'package:dio/dio.dart';
import 'package:groozil_app/core/errors/exceptions.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ErrorHandler {
  Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is SocketException) {
      return const NetworkFailure();
    } else if (error is ServerException) {
      return ServerFailure(error.message);
    } else if (error is NetworkException) {
      return NetworkFailure(error.message);
    } else if (error is CacheException) {
      return CacheFailure(error.message);
    } else if (error is ValidationException) {
      return ValidationFailure(error.message);
    } else if (error is AuthException) {
      return AuthFailure(error.message);
    } else if (error is NotFoundException) {
      return ServerFailure(error.message);
    } else {
      return UnknownFailure(error.toString());
    }
  }

  Failure _handleDioError(DioException error) {
    // If error was already converted to custom exception by ErrorInterceptor
    if (error.error is Exception) {
      return handle(error.error);
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure('Connection timeout. Please try again.');

      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);

      case DioExceptionType.cancel:
        return const UnknownFailure('Request cancelled');

      case DioExceptionType.connectionError:
        return const NetworkFailure(
          'No internet connection. Please check your network.',
        );

      case DioExceptionType.badCertificate:
        return const NetworkFailure('Bad certificate. Connection not secure.');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NetworkFailure();
        }
        return UnknownFailure(error.message ?? 'Unknown error occurred');
    }
  }

  Failure _handleResponseError(Response<dynamic>? response) {
    if (response == null) {
      return const ServerFailure('No response from server');
    }

    final statusCode = response.statusCode ?? 0;

    final message = _extractErrorMessage(response);

    switch (statusCode) {
      case 400:
        return ValidationFailure(message ?? 'Validation error');
      case 401:
        return AuthFailure(message ?? 'Unauthorized');
      case 403:
        return const AuthFailure('Access forbidden');
      case 404:
        return const ServerFailure('Resource not found');
      case 422:
        return ValidationFailure(message ?? 'Unprocessable entity');
      case 429:
        return const ServerFailure('Too many requests. Please try again later.');
      case 500:
        return const ServerFailure('Internal server error');
      case 502:
        return const ServerFailure('Bad gateway');
      case 503:
        return const ServerFailure('Service unavailable');
      default:
        return ServerFailure(message ?? 'Unknown error occurred');
    }
  }

  static String? _extractErrorMessage(Response<dynamic>? response) {
    try {
      if (response == null) return null;
      
      final data = response.data;
      if (data is Map<String, dynamic>) {
        // Priority: message > errors array > error field
        final message = data['message']?.toString();
        if (message != null && message.isNotEmpty) {
          return message;
        }
        
        // Check for errors array (validation errors)
        final errors = data['errors'];
        if (errors is List && errors.isNotEmpty) {
          return errors.join(', ');
        }
        
        // Fallback to error field
        final error = data['error']?.toString();
        if (error != null && error.isNotEmpty) {
          return error;
        }
      } else if (data is String) {
        return data;
      }
    } on Exception catch (e) {
      AppLogger.error('Error extracting message', error: e);
    }
    return null;
  }
}
