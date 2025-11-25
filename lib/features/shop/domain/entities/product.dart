import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groozil_app/features/category/domain/entities/category_entity.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {

  const factory Product({
    required String id,
    required String sku,
    required String nameEn,
    required String nameAr,
    required String categoryId,
    required double price,
    required int stock,
    required String unit,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? descriptionEn,
    String? descriptionAr,
    String? subcategoryId,
    String? partnerStoreId,
    double? comparePrice,
    String? brand,
    List<String>? images,
    @Default(false) bool isFeatured,
    @Default(true) bool isActive,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    CategoryEntity? category,
    CategoryEntity? subcategory,
  }) = _Product;
  // Private constructor for custom methods and getters
  const Product._();

  // --- Custom Methods & Getters ---

  String getName(String locale) {
    return locale == 'ar' ? nameAr : nameEn;
  }

  String? getDescription(String locale) {
    return locale == 'ar' ? descriptionAr : descriptionEn;
  }

  bool get inStock => stock > 0 && isActive;

  bool get hasDiscount => comparePrice != null && comparePrice! > price;

  double get discountPercentage {
    if (!hasDiscount) return 0;
    // The calculation remains the same
    return ((comparePrice! - price) / comparePrice!) * 100;
  }

  String get primaryImage {
    if (images != null && images!.isNotEmpty) {
      return images!.first;
    }
    return ''; // Placeholder image URL
  }

  String get formattedRating {
    return rating.toStringAsFixed(1);
  }

  String get formattedReviewCount {
    if (reviewCount >= 1000) {
      return '${(reviewCount / 1000).toStringAsFixed(1)}K';
    }
    return reviewCount.toString();
  }
}
