import 'package:groozil_app/features/category/data/mappers/category_mapper.dart';
import 'package:groozil_app/features/shop/data/models/product_model.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';

extension ProductMapper on ProductModel {
  Product toEntity() {
    return Product(
      id: id,
      sku: sku,
      nameEn: nameEn,
      nameAr: nameAr,
      categoryId: categoryId,
      price: double.tryParse(price) ?? 0.0,
      stock: stock,
      unit: unit,
      createdAt: createdAt,
      updatedAt: updatedAt,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      subcategoryId: subcategoryId,
      partnerStoreId: partnerStoreId,
      comparePrice: comparePrice != null ? double.tryParse(comparePrice!) : null,
      brand: brand,
      images: images,
      isFeatured: isFeatured,
      isActive: isActive,
      rating: double.tryParse(rating) ?? 0.0,
      reviewCount: reviewCount,
      category: category?.toEntity(),
      subcategory: subcategory?.toEntity(),
    );
  }
}
