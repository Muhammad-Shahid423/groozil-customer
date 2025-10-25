// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../network/client/api_client.dart' as _i211;
import '../network/handlers/error_handler.dart' as _i534;
import '../network/handlers/request_handler.dart' as _i785;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../network/interceptors/error_interceptor.dart' as _i511;
import '../network/interceptors/logging_interceptor.dart' as _i344;
import '../network/network_info.dart' as _i932;
import '../routing/app_router.dart' as _i282;
import '../services/storage/storage_service.dart' as _i968;
import '../services/storage/storage_service_impl.dart' as _i556;
import 'register_services_module.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerServicesModule = _$RegisterServicesModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerServicesModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i282.AppRouter>(() => _i282.AppRouter());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerServicesModule.secureStorage,
    );
    gh.lazySingleton<_i361.Dio>(() => registerServicesModule.dioClient);
    gh.lazySingleton<_i895.Connectivity>(
      () => registerServicesModule.connectivity,
    );
    gh.lazySingleton<_i211.ApiClient>(() => registerServicesModule.apiClient);
    gh.lazySingleton<_i511.ErrorInterceptor>(() => _i511.ErrorInterceptor());
    gh.lazySingleton<_i344.LoggingInterceptor>(
      () => _i344.LoggingInterceptor(),
    );
    gh.lazySingleton<_i534.ErrorHandler>(() => _i534.ErrorHandler());
    gh.lazySingleton<_i968.StorageService>(
      () => _i556.StorageServiceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i785.RequestHandler>(
      () => _i785.RequestHandler(gh<_i534.ErrorHandler>()),
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(gh<_i968.StorageService>()),
    );
    return this;
  }
}

class _$RegisterServicesModule extends _i207.RegisterServicesModule {}
