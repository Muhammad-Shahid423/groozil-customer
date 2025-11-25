import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity {

  const factory CategoryEntity({
    required String id,
    required String nameEn,
    required String nameAr,
    required String icon,
    required int order,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? descriptionEn,
    String? descriptionAr,
    String? image,
    String? parentId,
    @Default(true) bool isActive,
    List<CategoryEntity>? children,
    CategoryEntity? parent,
  }) = _CategoryEntity;
  // Add a const constructor to allow adding custom methods later
  const CategoryEntity._();

  // You can add your custom methods here:
  String getName(String locale) {
    return locale == 'ar' ? nameAr : nameEn;
  }

  String? getDescription(String locale) {
    return locale == 'ar' ? descriptionAr : descriptionEn;
  }
}
