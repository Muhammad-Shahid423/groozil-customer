import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/features/shop/domain/usecases/get_products_usecase.dart';
import 'package:groozil_app/features/shop/presentation/providers/product_usecase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'featured_products_provider.g.dart';

@riverpod
Future<List<Product>> featuredProducts(Ref ref) async {
  final getProductsUseCase = ref.watch(getProductsUseCaseProvider);
  
  final result = await getProductsUseCase(
    const GetProductsParams(
      page: 1,
      limit: 10,
    ),
  );

  return result.fold(
    (failure) => <Product>[],
    (List<Product> products) {
      // Filter featured products on the client side if needed
      // Or just return first 10 products as featured
      return products.take(10).toList();
    },
  );
}
