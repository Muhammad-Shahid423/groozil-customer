import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groozil_app/features/category/data/models/category_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {

  const factory ProductModel({
    required String id,
    required String sku,
    required String nameEn,
    required String nameAr,
    required String categoryId,
    required String price,
    required int stock,
    required String unit,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? descriptionEn,
    String? descriptionAr,
    String? subcategoryId,
    String? partnerStoreId,
    String? comparePrice,
    String? brand,
    List<String>? images,
    @Default(false) bool isFeatured,
    @Default(true) bool isActive,
    @Default('0.00') String rating,
    @Default(0) int reviewCount,
    CategoryModel? category,
    CategoryModel? subcategory,
  }) = _ProductModel;
  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
