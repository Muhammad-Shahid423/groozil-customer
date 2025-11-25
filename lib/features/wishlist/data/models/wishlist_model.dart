import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groozil_app/features/wishlist/data/models/wishlist_item_model.dart';

part 'wishlist_model.freezed.dart';
part 'wishlist_model.g.dart';

@freezed
abstract class WishlistModel with _$WishlistModel {
  const factory WishlistModel({
    required String id,
    required String userId,
    required String nameAr,
    required String nameEn,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDefault,
    @Default(false) bool isPublic,
    @Default([]) List<WishlistItemModel> items,
  }) = _WishlistModel;

  factory WishlistModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistModelFromJson(json);
}
