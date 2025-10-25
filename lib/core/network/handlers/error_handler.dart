import 'dart:io';
import 'package:dio/dio.dart';
import 'package:groozil_app/core/errors/exceptions.dart';
import 'package:groozil_app/core/errors/failures.dart';
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

  Failure _handleResponseError(Response? response) {
    if (response == null) {
      return const ServerFailure('No response from server');
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    var message = 'An error occurred';
    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? message;
    }

    switch (statusCode) {
      case 400:
        return ValidationFailure(message);
      case 401:
        return AuthFailure(message);
      case 403:
        return const AuthFailure('Access forbidden');
      case 404:
        return const ServerFailure('Resource not found');
      case 422:
        return ValidationFailure(message);
      case 429:
        return const ServerFailure('Too many requests. Please try again later.');
      case 500:
        return const ServerFailure('Internal server error');
      case 502:
        return const ServerFailure('Bad gateway');
      case 503:
        return const ServerFailure('Service unavailable');
      default:
        return ServerFailure(message);
    }
  }
}
