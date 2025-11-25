import 'package:groozil_app/features/shop/data/mappers/product_mapper.dart';
import 'package:groozil_app/features/wishlist/data/models/wishlist_item_model.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_item.dart';

extension WishlistItemMapper on WishlistItemModel {
  WishlistItem toEntity() {
    return WishlistItem(
      id: id,
      wishlistId: wishlistId,
      productId: productId,
      notes: notes,
      priority: priority,
      priceWhenAdded: double.tryParse(priceWhenAdded) ?? 0.0,
      currentPrice: double.tryParse(currentPrice) ?? 0.0,
      notifyOnDiscount: notifyOnDiscount,
      notifyOnStock: notifyOnStock,
      addedAt: addedAt,
      product: product?.toEntity(),
    );
  }
}
