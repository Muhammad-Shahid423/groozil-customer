// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
  id: json['id'] as String,
  titleAr: json['titleAr'] as String,
  titleEn: json['titleEn'] as String,
  imageUrl: json['imageUrl'] as String,
  bannerType: json['bannerType'] as String,
  position: json['position'] as String,
  actionType: json['actionType'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  descriptionAr: json['descriptionAr'] as String?,
  descriptionEn: json['descriptionEn'] as String?,
  mobileImageUrl: json['mobileImageUrl'] as String?,
  actionValue: json['actionValue'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  isActive: json['isActive'] as bool? ?? true,
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  showOnHomepage: json['showOnHomepage'] as bool? ?? false,
  showOnCategories: json['showOnCategories'] as bool? ?? false,
  showOnCheckout: json['showOnCheckout'] as bool? ?? false,
  targetCategories:
      (json['targetCategories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  targetUserTiers:
      (json['targetUserTiers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  newUsersOnly: json['newUsersOnly'] as bool? ?? false,
  impressions: (json['impressions'] as num?)?.toInt() ?? 0,
  clicks: (json['clicks'] as num?)?.toInt() ?? 0,
  ctr: (json['ctr'] as num?)?.toDouble() ?? 0.0,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleAr': instance.titleAr,
      'titleEn': instance.titleEn,
      'imageUrl': instance.imageUrl,
      'bannerType': instance.bannerType,
      'position': instance.position,
      'actionType': instance.actionType,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'mobileImageUrl': instance.mobileImageUrl,
      'actionValue': instance.actionValue,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'isActive': instance.isActive,
      'sortOrder': instance.sortOrder,
      'showOnHomepage': instance.showOnHomepage,
      'showOnCategories': instance.showOnCategories,
      'showOnCheckout': instance.showOnCheckout,
      'targetCategories': instance.targetCategories,
      'targetUserTiers': instance.targetUserTiers,
      'newUsersOnly': instance.newUsersOnly,
      'impressions': instance.impressions,
      'clicks': instance.clicks,
      'ctr': instance.ctr,
      'metadata': instance.metadata,
    };
