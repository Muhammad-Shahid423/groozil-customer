// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishlistModel _$WishlistModelFromJson(Map<String, dynamic> json) =>
    _WishlistModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isDefault: json['isDefault'] as bool? ?? false,
      isPublic: json['isPublic'] as bool? ?? false,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => WishlistItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WishlistModelToJson(_WishlistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isDefault': instance.isDefault,
      'isPublic': instance.isPublic,
      'items': instance.items,
    };
