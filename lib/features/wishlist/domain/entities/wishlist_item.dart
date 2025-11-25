import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';

part 'wishlist_item.freezed.dart';

@freezed
abstract class WishlistItem with _$WishlistItem {
  const factory WishlistItem({
    required String id,
    required String wishlistId,
    required String productId,
    required double priceWhenAdded,
    required double currentPrice,
    required DateTime addedAt,
    String? notes,
    @Default(0) int priority,
    @Default(false) bool notifyOnDiscount,
    @Default(false) bool notifyOnStock,
    Product? product,
  }) = _WishlistItem;

  const WishlistItem._();

  bool get hasDiscount => currentPrice < priceWhenAdded;
  
  double get discountPercentage {
    if (!hasDiscount) return 0;
    return ((priceWhenAdded - currentPrice) / priceWhenAdded) * 100;
  }
}
