import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_item.dart';

abstract class WishlistRepository {
  Future<Either<Failure, WishlistEntity>> getWishlist();
  Future<Either<Failure, WishlistItem>> addToWishlist({
    required String productId,
    String? notes,
    int? priority,
    bool? notifyOnDiscount,
    bool? notifyOnStock,
  });
  Future<Either<Failure, void>> removeFromWishlist(String wishlistItemId);
  Future<Either<Failure, void>> clearWishlist();
}
