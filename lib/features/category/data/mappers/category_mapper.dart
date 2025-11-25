import 'package:groozil_app/features/category/data/models/category_model.dart';
import 'package:groozil_app/features/category/domain/entities/category_entity.dart';

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      image: image,
      icon: icon,
      parentId: parentId,
      order: order,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      children: children?.map((c) => CategoryModelX(c).toEntity()).toList(),
      parent: CategoryModelX(parent)?.toEntity(),
    );
  }
}
