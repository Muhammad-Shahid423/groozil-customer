import 'package:groozil_app/features/wishlist/data/mappers/wishlist_item_mapper.dart';
import 'package:groozil_app/features/wishlist/data/models/wishlist_model.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_entity.dart';

extension WishlistMapper on WishlistModel {
  WishlistEntity toEntity() {
    return WishlistEntity(
      id: id,
      userId: userId,
      nameAr: nameAr,
      nameEn: nameEn,
      isDefault: isDefault,
      isPublic: isPublic,
      createdAt: createdAt,
      updatedAt: updatedAt,
      items: items.map((item) => item.toEntity()).toList(),
    );
  }
}
