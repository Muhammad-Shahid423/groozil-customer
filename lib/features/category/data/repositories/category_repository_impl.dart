import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/network/handlers/request_handler.dart';
import 'package:groozil_app/core/network/network_info.dart';
import 'package:groozil_app/features/category/data/datasources/category_remote_datasource.dart';
import 'package:groozil_app/features/category/data/mappers/category_mapper.dart';
import 'package:groozil_app/features/category/domain/entities/category_entity.dart';
import 'package:groozil_app/features/category/domain/repositories/category_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {

  CategoryRepositoryImpl(
    this._remoteDataSource,
    this._requestHandler,
    this._networkInfo,
  );
  final CategoryRemoteDataSource _remoteDataSource;
  final RequestHandler _requestHandler;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final categoryModels = await _remoteDataSource.getCategories();
        return categoryModels.map((model) => model.toEntity()).toList();
      },
    );
  }
}
