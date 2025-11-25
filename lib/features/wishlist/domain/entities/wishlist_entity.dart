import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_item.dart';

part 'wishlist_entity.freezed.dart';

@freezed
abstract class WishlistEntity with _$WishlistEntity {
  const factory WishlistEntity({
    required String id,
    required String userId,
    required String nameAr,
    required String nameEn,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDefault,
    @Default(false) bool isPublic,
    @Default([]) List<WishlistItem> items,
  }) = _WishlistEntity;

  const WishlistEntity._();

  String getName(String locale) {
    return locale == 'ar' ? nameAr : nameEn;
  }

  int get itemCount => items.length;
  
  bool containsProduct(String productId) {
    return items.any((item) => item.productId == productId);
  }
}
