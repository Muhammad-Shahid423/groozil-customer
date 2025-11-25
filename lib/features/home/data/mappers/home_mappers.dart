import 'package:groozil_app/core/utils/parser.dart';
import 'package:groozil_app/features/category/data/mappers/category_mapper.dart';
import 'package:groozil_app/features/home/data/models/banner_model.dart';
import 'package:groozil_app/features/home/domain/entities/banner_entity.dart';
import 'package:groozil_app/features/shop/data/models/product_model.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart' as product;

extension BannerModelX on BannerModel {
  BannerEntity toEntity() {
    return BannerEntity(
      id: id,
      titleAr: titleAr,
      titleEn: titleEn,
      descriptionAr: descriptionAr,
      descriptionEn: descriptionEn,
      imageUrl: imageUrl,
      mobileImageUrl: mobileImageUrl,
      bannerType: _parseBannerType(bannerType),
      position: _parseBannerPosition(position),
      actionType: _parseBannerAction(actionType),
      actionValue: actionValue,
      startDate: startDate,
      endDate: endDate,
      isActive: isActive,
      sortOrder: sortOrder,
      showOnHomepage: showOnHomepage,
      showOnCategories: showOnCategories,
      showOnCheckout: showOnCheckout,
      targetCategories: targetCategories,
      targetUserTiers: targetUserTiers,
      newUsersOnly: newUsersOnly,
      impressions: impressions,
      clicks: clicks,
      ctr: ctr,
      metadata: metadata,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  BannerType _parseBannerType(String type) {
    switch (type.toLowerCase()) {
      case 'promotional':
        return BannerType.promotional;
      case 'announcement':
        return BannerType.announcement;
      case 'seasonal':
        return BannerType.seasonal;
      case 'flash_sale':
        return BannerType.flash_sale;
      default:
        return BannerType.promotional;
    }
  }

  BannerPosition _parseBannerPosition(String pos) {
    switch (pos.toLowerCase()) {
      case 'top':
        return BannerPosition.top;
      case 'middle':
        return BannerPosition.middle;
      case 'bottom':
        return BannerPosition.bottom;
      case 'floating':
        return BannerPosition.floating;
      default:
        return BannerPosition.top;
    }
  }

  BannerAction _parseBannerAction(String action) {
    switch (action.toLowerCase()) {
      case 'none':
        return BannerAction.none;
      case 'category':
        return BannerAction.category;
      case 'product':
        return BannerAction.product;
      case 'external_link':
        return BannerAction.external_link;
      case 'deep_link':
        return BannerAction.deep_link;
      default:
        return BannerAction.none;
    }
  }
}

extension ProductModelX on ProductModel {
  product.Product toEntity() {
    return product.Product(
      id: id,
      sku: sku,
      nameEn: nameEn,
      nameAr: nameAr,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      categoryId: categoryId,
      subcategoryId: subcategoryId,
      partnerStoreId: partnerStoreId,
      price: Parser.toDouble(price),
      comparePrice: Parser.toDouble(comparePrice),
      stock: stock,
      unit: unit,
      brand: brand,
      images: images,
      isFeatured: isFeatured,
      isActive: isActive,
      rating: Parser.toDouble(rating),
      reviewCount: reviewCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
      category: category?.toEntity(),
      subcategory: subcategory?.toEntity(),
    );
  }
}
