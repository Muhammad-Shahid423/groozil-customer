// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishlistItemModel _$WishlistItemModelFromJson(Map<String, dynamic> json) =>
    _WishlistItemModel(
      id: json['id'] as String,
      wishlistId: json['wishlistId'] as String,
      productId: json['productId'] as String,
      priceWhenAdded: json['priceWhenAdded'] as String,
      currentPrice: json['currentPrice'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
      notes: json['notes'] as String?,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      notifyOnDiscount: json['notifyOnDiscount'] as bool? ?? false,
      notifyOnStock: json['notifyOnStock'] as bool? ?? false,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WishlistItemModelToJson(_WishlistItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wishlistId': instance.wishlistId,
      'productId': instance.productId,
      'priceWhenAdded': instance.priceWhenAdded,
      'currentPrice': instance.currentPrice,
      'addedAt': instance.addedAt.toIso8601String(),
      'notes': instance.notes,
      'priority': instance.priority,
      'notifyOnDiscount': instance.notifyOnDiscount,
      'notifyOnStock': instance.notifyOnStock,
      'product': instance.product,
    };
