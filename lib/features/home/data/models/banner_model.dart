import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
abstract class BannerModel with _$BannerModel {

  const factory BannerModel({
    required String id,
    required String titleAr,
    required String titleEn,
    required String imageUrl,
    required String bannerType,
    required String position,
    required String actionType,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? descriptionAr,
    String? descriptionEn,
    String? mobileImageUrl,
    String? actionValue,
    DateTime? startDate,
    DateTime? endDate,
    @Default(true) bool isActive,
    @Default(0) int sortOrder,
    @Default(false) bool showOnHomepage,
    @Default(false) bool showOnCategories,
    @Default(false) bool showOnCheckout,
    @Default([]) List<String> targetCategories,
    @Default([]) List<String> targetUserTiers,
    @Default(false) bool newUsersOnly,
    @Default(0) int impressions,
    @Default(0) int clicks,
    @Default(0.0) double ctr,
    Map<String, dynamic>? metadata,
  }) = _BannerModel;
  const BannerModel._();

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
