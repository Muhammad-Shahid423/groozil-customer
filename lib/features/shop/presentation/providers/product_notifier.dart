import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/features/shop/domain/entities/product_filter.dart';
import 'package:groozil_app/features/shop/domain/usecases/get_products_by_category_usecase.dart';
import 'package:groozil_app/features/shop/domain/usecases/get_products_usecase.dart';
import 'package:groozil_app/features/shop/domain/usecases/search_products_usecase.dart';
import 'package:groozil_app/features/shop/presentation/providers/product_state.dart';
import 'package:groozil_app/features/shop/presentation/providers/product_usecase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  late final GetProductsUseCase _getProductsUseCase;
  late final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;
  late final SearchProductsUseCase _searchProductsUseCase;

  ProductFilter _currentFilter = const ProductFilter();
  String? _currentCategoryId;
  int _currentPage = 1;
  List<Product> _allProducts = [];
  bool _hasMoreProducts = true;

  ProductFilter get currentFilter => _currentFilter;
  String? get currentCategoryId => _currentCategoryId;

  @override
  ProductState build() {
    _getProductsUseCase = ref.read(getProductsUseCaseProvider);
    _getProductsByCategoryUseCase = ref.read(getProductsByCategoryUseCaseProvider);
    _searchProductsUseCase = ref.read(searchProductsUseCaseProvider);

    return const ProductState.initial();
  }

  /// Loads products based on current filter or a new provided filter.
  Future<void> loadProducts({ProductFilter? filter}) async {
    _currentPage = 1;
    _allProducts = [];
    _hasMoreProducts = true;
    _currentCategoryId = null;

    if (filter != null) {
      _currentFilter = filter;
    }

    state = const ProductState.loading();

    final result = await _getProductsUseCase(
      GetProductsParams(
        page: _currentPage,
        filter: _currentFilter,
      ),
    );

    result.fold(
          (failure) => state = ProductState.error(failure.message),
          (products) {
        _allProducts = products;
        _hasMoreProducts = products.length >= 20;
        state = ProductState.loaded(products);
      },
    );
  }

  /// Loads products specific to a category, clearing other filters.
  Future<void> loadProductsByCategory(String categoryId) async {
    _currentCategoryId = categoryId;
    _currentPage = 1;
    _allProducts = [];
    _hasMoreProducts = true;
    // _currentFilter = const ProductFilter();

    state = const ProductState.loading();

    final result = await _getProductsByCategoryUseCase(
      GetProductsByCategoryParams(
        categoryId: categoryId,
        page: _currentPage,
        filter: _currentFilter,
      ),
    );

    result.fold(
          (failure) => state = ProductState.error(failure.message),
          (products) {
        _allProducts = products;
        _hasMoreProducts = products.length >= 20;
        state = ProductState.loaded(products);
      },
    );
  }

  /// Searches products based on a query.
  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      await loadProducts();
      return;
    }

    state = const ProductState.loading();

    final result = await _searchProductsUseCase(query);

    result.fold(
          (failure) => state = ProductState.error(failure.message),
          (products) {
        _allProducts = products;
        _hasMoreProducts = false; // Assume search results are one-off list
        state = ProductState.loaded(products);
      },
    );
  }

  /// Loads the next page of products (either filtered or by category).
  Future<void> loadMoreProducts() async {
    if (!_hasMoreProducts) return;

    _currentPage++;

    Either<dynamic, dynamic> result;

    if (_currentCategoryId != null) {
      result = await _getProductsByCategoryUseCase(
        GetProductsByCategoryParams(
          categoryId: _currentCategoryId!,
          page: _currentPage,
          filter: _currentFilter,
        ),
      );
    } else {
      // Load with filter
      result = await _getProductsUseCase(
        GetProductsParams(
          page: _currentPage,
          filter: _currentFilter,
        ),
      );
    }

    result.fold(
          (failure) {
        // Decrement page on failure to retry loading next time
        _currentPage--;
        // Optionally, show a toast or message for pagination error
        // print('Error loading more products: ${failure.message}');
      },
          (products) {
            final productsList = products as List<Product>;
        _hasMoreProducts = products.length >= 20;
        _allProducts.addAll(productsList);
        // Force state update by creating a new list instance
        state = ProductState.loaded(List.from(_allProducts));
      },
    );
  }

  /// Applies a new filter and reloads products from page 1.
  Future<void> applyFilter(ProductFilter filter) async {
    _currentFilter = filter;
    await refresh();
  }

  /// Clears the current filter and reloads products from page 1.
  Future<void> clearFilter() async {
    _currentFilter = const ProductFilter();
    await refresh();
  }

  /// Refreshes the current list of products (category or filtered).
  Future<void> refresh() async {
    if (_currentCategoryId != null) {
      await loadProductsByCategory(_currentCategoryId!);
    } else {
      await loadProducts(filter: _currentFilter);
    }
  }
}
