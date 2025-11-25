import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/network/handlers/request_handler.dart';
import 'package:groozil_app/core/network/network_info.dart';
import 'package:groozil_app/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:groozil_app/features/wishlist/data/mappers/wishlist_item_mapper.dart';
import 'package:groozil_app/features/wishlist/data/mappers/wishlist_mapper.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:groozil_app/features/wishlist/domain/repostories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl(
    this._remoteDataSource,
    this._requestHandler,
    this._networkInfo,
  );
  
  final WishlistRemoteDataSource _remoteDataSource;
  final RequestHandler _requestHandler;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, WishlistEntity>> getWishlist() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
      () async {
        final wishlistModel = await _remoteDataSource.getWishlist();
        if (wishlistModel == null) {
          throw Exception('Wishlist not found');
        }
        return wishlistModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, WishlistItem>> addToWishlist({
    required String productId,
    String? notes,
    int? priority,
    bool? notifyOnDiscount,
    bool? notifyOnStock,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
      () async {
        final itemModel = await _remoteDataSource.addToWishlist(
          productId: productId,
          notes: notes,
          priority: priority,
          notifyOnDiscount: notifyOnDiscount,
          notifyOnStock: notifyOnStock,
        );
        return itemModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, void>> removeFromWishlist(String wishlistItemId) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
      () async {
        await _remoteDataSource.removeFromWishlist(wishlistItemId);
      },
    );
  }

  @override
  Future<Either<Failure, void>> clearWishlist() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    return _requestHandler.handle(
      () async {
        // TODO: Implement clear wishlist if API supports it
        // For now, this would need to fetch all items and delete them one by one
        throw UnimplementedError('Clear wishlist not yet implemented');
      },
    );
  }
}
