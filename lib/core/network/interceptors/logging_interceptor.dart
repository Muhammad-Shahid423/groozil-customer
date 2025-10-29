import 'package:dio/dio.dart';
import 'package:groozil_app/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.debug(
      'API Request',
      error: {
        'method': options.method,
        'path': options.path,
        'queryParameters': options.queryParameters,
      },
    );
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    AppLogger.debug(
      'API Response',
      error: {
        'statusCode': response.statusCode,
        'path': response.requestOptions.path,
      },
    );
    handler.next(response);
  }
}
