import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/network/handlers/request_handler.dart';
import 'package:groozil_app/core/network/network_info.dart';
import 'package:groozil_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:groozil_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:groozil_app/features/auth/data/mappers/auth_mappers.dart';
import 'package:groozil_app/features/auth/domain/entities/auth_response.dart';
import 'package:groozil_app/features/auth/domain/entities/user.dart';
import 'package:groozil_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._requestHandler,
    this._networkInfo,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final RequestHandler _requestHandler;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, void>> sendOtp({String? phone, String? email}) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
      () async {
        await _remoteDataSource.sendOtp(phone: phone, email: email);
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponse>> verifyOtp({
    String? phone,
    String? email,
    required String otp,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final authResponseModel = await _remoteDataSource.verifyOtp(
          phone: phone,
          email: email,
          otp: otp,
        );

        await _localDataSource.saveTokens(
          authResponseModel.accessToken,
          authResponseModel.refreshToken,
        );

        await _localDataSource.saveUser(authResponseModel.user);

        return authResponseModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponse>> googleSignIn(String idToken) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final authResponseModel = await _remoteDataSource.googleSignIn(idToken);

        await _localDataSource.saveTokens(
          authResponseModel.accessToken,
          authResponseModel.refreshToken,
        );

        await _localDataSource.saveUser(authResponseModel.user);

        return authResponseModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponse>> appleSignIn(String idToken) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final authResponseModel = await _remoteDataSource.appleSignIn(idToken);

        await _localDataSource.saveTokens(
          authResponseModel.accessToken,
          authResponseModel.refreshToken,
        );

        await _localDataSource.saveUser(authResponseModel.user);
        // await _localDataSource.setLoggedIn(true);

        return authResponseModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponse>> updateProfile({
    required String name,
    String? phone,
    String? email,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final authResponseModel = await _remoteDataSource.updateProfile(
          name: name,
          phone: phone,
          email: email,
        );

        await _localDataSource.saveTokens(
          authResponseModel.accessToken,
          authResponseModel.refreshToken,
        );

        await _localDataSource.saveUser(authResponseModel.user);

        return authResponseModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return _requestHandler.handle(
          () async {
        if (await _networkInfo.isConnected) {
          await _remoteDataSource.logout();
        }

        await _localDataSource.clearAuthData();
      },
    );
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    return _requestHandler.handle(
      () async => _localDataSource.isLoggedIn()
    );
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    return _requestHandler.handle(
      () async {
        final userModel = await _localDataSource.getUser();
        return userModel?.toEntity();
      },
    );
  }
}
