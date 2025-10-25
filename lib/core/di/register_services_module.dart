import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/core/network/client/api_client.dart';
import 'package:groozil_app/core/network/dio_client.dart';
import 'package:groozil_app/core/network/interceptors/auth_interceptor.dart';
import 'package:groozil_app/core/network/interceptors/error_interceptor.dart';
import 'package:groozil_app/core/network/interceptors/logging_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterServicesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  Dio get dioClient => DioClient.dio(
    getIt<AuthInterceptor>(),
    getIt<ErrorInterceptor>(),
    getIt<LoggingInterceptor>(),
  );

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  ApiClient get apiClient => ApiClient(dioClient);
}
