// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      sku: json['sku'] as String,
      nameEn: json['nameEn'] as String,
      nameAr: json['nameAr'] as String,
      categoryId: json['categoryId'] as String,
      price: json['price'] as String,
      stock: (json['stock'] as num).toInt(),
      unit: json['unit'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      subcategoryId: json['subcategoryId'] as String?,
      partnerStoreId: json['partnerStoreId'] as String?,
      comparePrice: json['comparePrice'] as String?,
      brand: json['brand'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isFeatured: json['isFeatured'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      rating: json['rating'] as String? ?? '0.00',
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      subcategory: json['subcategory'] == null
          ? null
          : CategoryModel.fromJson(json['subcategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'categoryId': instance.categoryId,
      'price': instance.price,
      'stock': instance.stock,
      'unit': instance.unit,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'subcategoryId': instance.subcategoryId,
      'partnerStoreId': instance.partnerStoreId,
      'comparePrice': instance.comparePrice,
      'brand': instance.brand,
      'images': instance.images,
      'isFeatured': instance.isFeatured,
      'isActive': instance.isActive,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'category': instance.category,
      'subcategory': instance.subcategory,
    };
