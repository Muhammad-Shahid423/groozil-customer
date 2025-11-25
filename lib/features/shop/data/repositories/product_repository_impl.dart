import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/network/handlers/request_handler.dart';
import 'package:groozil_app/core/network/network_info.dart';
import 'package:groozil_app/features/home/data/mappers/home_mappers.dart';
import 'package:groozil_app/features/shop/data/datasources/product_remote_datasource.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/features/shop/domain/entities/product_filter.dart';
import 'package:groozil_app/features/shop/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {

  ProductRepositoryImpl(
    this._remoteDataSource,
    this._requestHandler,
    this._networkInfo,
  );
  final ProductRemoteDataSource _remoteDataSource;
  final RequestHandler _requestHandler;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, List<Product>>> getProducts({
    int page = 1,
    int limit = 20,
    ProductFilter? filter,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final productModels = await _remoteDataSource.getProducts(
          page: page,
          limit: limit,
          filter: filter,
        );
        return productModels.map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final productModel = await _remoteDataSource.getProductById(id);
        return productModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final productModels = await _remoteDataSource.searchProducts(query);
        return productModels.map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String categoryId, {
        int page = 1,
        int limit = 20,
        ProductFilter? filter,
      }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final productModels = await _remoteDataSource.getProductsByCategory(
          categoryId,
          page: page,
          limit: limit,
          filter: filter,
        );
        return productModels.map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, List<Product>>> getFeaturedProducts() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
          () async {
        final productModels = await _remoteDataSource.getFeaturedProducts();
        return productModels.map((model) => model.toEntity()).toList();
      },
    );
  }
}
