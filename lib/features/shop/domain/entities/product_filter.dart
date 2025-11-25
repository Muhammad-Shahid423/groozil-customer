import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_filter.freezed.dart';

@freezed
abstract class ProductFilter with _$ProductFilter {

  const factory ProductFilter({
    bool? inStock,
    double? minPrice,
    double? maxPrice,
    String? packSize,
    int? minRating,
    String? sortBy,
    String? categoryId,
  }) = _ProductFilter;
  const ProductFilter._();

  ProductFilter clear() {
    return const ProductFilter();
  }
  bool get hasActiveFilters {
    return inStock != null ||
        minPrice != null ||
        maxPrice != null ||
        packSize != null ||
        minRating != null ||
        categoryId != null;
  }
}
