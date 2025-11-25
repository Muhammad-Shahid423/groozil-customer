import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {

  const factory CategoryModel({
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
    List<CategoryModel>? children,
    CategoryModel? parent,
  }) = _CategoryModel;
  const CategoryModel._();

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
