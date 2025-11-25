import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/network/handlers/request_handler.dart';
import 'package:groozil_app/core/network/network_info.dart';
import 'package:groozil_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:groozil_app/features/home/data/mappers/home_mappers.dart';
import 'package:groozil_app/features/home/domain/entities/banner_entity.dart';
import 'package:groozil_app/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {

  HomeRepositoryImpl(
    this._remoteDataSource,
    this._requestHandler,
    this._networkInfo,
  );
  final HomeRemoteDataSource _remoteDataSource;
  final RequestHandler _requestHandler;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final bannerModels = await _remoteDataSource.getBanners();
        return bannerModels.map((model) => model.toEntity()).toList();
      },
    );
  }
}
