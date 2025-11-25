import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_entity.freezed.dart';

enum BannerType {
  promotional,
  announcement,
  seasonal,
  // @JsonValue('flash_sale') // Optional: Use this if the JSON key is different from the enum name
  flash_sale,
}

enum BannerPosition { top, middle, bottom, floating }

enum BannerAction { none, category, product, external_link, deep_link }

// --- Freezed Class ---

@freezed
abstract class BannerEntity with _$BannerEntity {

  const factory BannerEntity({
    required String id,
    required String titleAr,
    required String titleEn,
    required String imageUrl,
    required BannerType bannerType,
    required BannerPosition position,
    required BannerAction actionType,
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
  }) = _BannerEntity;
  // Private constructor to allow adding custom methods/getters
  const BannerEntity._();

  // --- Custom Methods & Getters ---

  String getTitle(String locale) {
    return locale == 'ar' ? titleAr : titleEn;
  }

  String? getDescription(String locale) {
    return locale == 'ar' ? descriptionAr : descriptionEn;
  }

  String get displayImage => mobileImageUrl ?? imageUrl;

  bool get isCurrentlyActive {
    if (!isActive) return false;
    final now = DateTime.now();
    if (startDate != null && now.isBefore(startDate!)) return false;
    if (endDate != null && now.isAfter(endDate!)) return false;
    return true;
  }
}
