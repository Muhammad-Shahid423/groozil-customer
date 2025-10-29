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

import '../../features/auth/data/datasources/auth_local_datasource.dart'
    as _i992;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/apple_sign_in_usecase.dart'
    as _i521;
import '../../features/auth/domain/usecases/check_auth_status_usecase.dart'
    as _i52;
import '../../features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i17;
import '../../features/auth/domain/usecases/google_sign_in_usecase.dart'
    as _i91;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/send_otp_usecase.dart' as _i663;
import '../../features/auth/domain/usecases/update_profile_usecase.dart'
    as _i798;
import '../../features/auth/domain/usecases/verify_otp_usecase.dart' as _i503;
import '../network/client/api_client.dart' as _i211;
import '../network/handlers/error_handler.dart' as _i534;
import '../network/handlers/request_handler.dart' as _i785;
import '../network/handlers/response_handler.dart' as _i51;
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
    gh.lazySingleton<_i51.ResponseHandler>(() => _i51.ResponseHandler());
    gh.lazySingleton<_i968.StorageService>(
      () => _i556.StorageServiceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => _i161.AuthRemoteDataSourceImpl(gh<_i211.ApiClient>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i785.RequestHandler>(
      () => _i785.RequestHandler(gh<_i534.ErrorHandler>()),
    );
    gh.lazySingleton<_i992.AuthLocalDataSource>(
      () => _i992.AuthLocalDataSourceImpl(gh<_i968.StorageService>()),
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(
        gh<_i968.StorageService>(),
        gh<_i51.ResponseHandler>(),
      ),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i161.AuthRemoteDataSource>(),
        gh<_i992.AuthLocalDataSource>(),
        gh<_i785.RequestHandler>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i798.UpdateProfileUseCase>(
      () => _i798.UpdateProfileUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i91.GoogleSignInUseCase>(
      () => _i91.GoogleSignInUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i521.AppleSignInUseCase>(
      () => _i521.AppleSignInUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i663.SendOtpUseCase>(
      () => _i663.SendOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i52.CheckAuthStatusUseCase>(
      () => _i52.CheckAuthStatusUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i17.GetCurrentUserUseCase>(
      () => _i17.GetCurrentUserUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i503.VerifyOtpUseCase>(
      () => _i503.VerifyOtpUseCase(gh<_i787.AuthRepository>()),
    );
    return this;
  }
}

class _$RegisterServicesModule extends _i207.RegisterServicesModule {}
