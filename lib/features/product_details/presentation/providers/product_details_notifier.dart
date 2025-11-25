import 'dart:async';

import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/features/shop/domain/usecases/get_product_by_id_usecase.dart';
import 'package:groozil_app/features/product_details/presentation/providers/product_details_state.dart';
import 'package:groozil_app/features/shop/presentation/providers/product_usecase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_details_notifier.g.dart';

@riverpod
class ProductDetails extends _$ProductDetails {
  @override
  ProductDetailsState build(String productId) {
    _getProductByIdUseCase = ref.read(getProductByIdUseCaseProvider);
    return const ProductDetailsState.initial();
  }

  late final GetProductByIdUseCase _getProductByIdUseCase;

  /// Load product from cache (instant), if not then fetch fresh data
  Future<void> loadProduct(String productId, {Object? cachedProduct}) async {
    if (cachedProduct != null && cachedProduct is Product) {
      state = ProductDetailsState.loaded(cachedProduct);
    } else {
      state = const ProductDetailsState.loading();
      await _fetchFreshProduct(productId);
    }
  }

  /// Fetch fresh product data from API
  Future<void> _fetchFreshProduct(String productId) async {
    final result = await _getProductByIdUseCase(productId);

    result.fold(
      (failure) {
        state.maybeWhen(
          loaded: (product) {
            state = ProductDetailsState.loaded(product);
          },
          orElse: () {
            state = ProductDetailsState.error(failure.message);
          },
        );
      },
      (product) => state = ProductDetailsState.loaded(product),
    );
  }

  Future<void> refresh() async {
    await loadProduct(productId);
  }
}
