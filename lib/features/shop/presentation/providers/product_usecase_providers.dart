import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/features/shop/domain/usecases/get_product_by_id_usecase.dart';
import 'package:groozil_app/features/shop/domain/usecases/get_products_by_category_usecase.dart';
import 'package:groozil_app/features/shop/domain/usecases/get_products_usecase.dart';
import 'package:groozil_app/features/shop/domain/usecases/search_products_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_usecase_providers.g.dart';

@riverpod
GetProductsUseCase getProductsUseCase(Ref ref) {
  return getIt<GetProductsUseCase>();
}

@riverpod
GetProductsByCategoryUseCase getProductsByCategoryUseCase(Ref ref) {
  return getIt<GetProductsByCategoryUseCase>();
}

@riverpod
SearchProductsUseCase searchProductsUseCase(Ref ref) {
  return getIt<SearchProductsUseCase>();
}

@riverpod
GetProductByIdUseCase getProductByIdUseCase(Ref ref) {
  return getIt<GetProductByIdUseCase>();
}
