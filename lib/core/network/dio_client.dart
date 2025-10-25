import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:groozil_app/core/constants/app_constants.dart';
import 'package:groozil_app/core/network/api_constants.dart';
import 'package:groozil_app/core/network/interceptors/auth_interceptor.dart';
import 'package:groozil_app/core/network/interceptors/error_interceptor.dart';
import 'package:groozil_app/core/network/interceptors/logging_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._();

  @lazySingleton
  static Dio dio(
      AuthInterceptor authInterceptor,
      ErrorInterceptor errorInterceptor,
      LoggingInterceptor loggingInterceptor,
      ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: AppConstants.connectionTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
        sendTimeout: AppConstants.connectionTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          // Accept all status codes and handle in interceptor
          return status != null && status < 500;
        },
      ),
    );

    // Add interceptors in order (order matters!)
    dio.interceptors.addAll([
      authInterceptor,      // First: Add auth tokens
      errorInterceptor,     // Second: Handle errors
      loggingInterceptor,   // Last: Log everything
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
    ]);

    return dio;
  }
}
