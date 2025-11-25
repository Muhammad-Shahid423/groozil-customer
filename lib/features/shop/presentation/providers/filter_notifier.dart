import 'package:groozil_app/features/shop/domain/entities/product_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_notifier.g.dart';

@riverpod
class FilterNotifier extends _$FilterNotifier {
  @override
  ProductFilter build() {
    return const ProductFilter();
  }

  void setAvailability({bool? inStock}) {
    state = state.copyWith(inStock: inStock);
  }

  void setPriceRange(double? minPrice, double? maxPrice) {
    state = state.copyWith(
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }

  void setPackSize(String? packSize) {
    state = state.copyWith(packSize: packSize);
  }

  void setMinRating(int? minRating) {
    state = state.copyWith(minRating: minRating);
  }

  void setSortBy(String? sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  void setCategoryId(String? categoryId) {
    state = state.copyWith(categoryId: categoryId);
  }

  void clearAllFilters() {
    state = const ProductFilter();
  }

  void applyFilter(ProductFilter filter) {
    state = filter;
  }
}

@riverpod
int activeFilterCount(Ref ref) {
  final filter = ref.watch(filterProvider);
  var count = 0;

  if (filter.inStock != null) count++;
  if (filter.minPrice != null || filter.maxPrice != null) count++;
  if (filter.packSize != null) count++;
  if (filter.minRating != null) count++;
  if (filter.categoryId != null) count++;

  return count;
}
