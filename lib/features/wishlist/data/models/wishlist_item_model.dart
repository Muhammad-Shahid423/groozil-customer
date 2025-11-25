import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groozil_app/features/shop/data/models/product_model.dart';

part 'wishlist_item_model.freezed.dart';
part 'wishlist_item_model.g.dart';

@freezed
abstract class WishlistItemModel with _$WishlistItemModel {
  const factory WishlistItemModel({
    required String id,
    required String wishlistId,
    required String productId,
    required String priceWhenAdded,
    required String currentPrice,
    required DateTime addedAt,
    String? notes,
    @Default(0) int priority,
    @Default(false) bool notifyOnDiscount,
    @Default(false) bool notifyOnStock,
    ProductModel? product,
  }) = _WishlistItemModel;

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemModelFromJson(json);
}
