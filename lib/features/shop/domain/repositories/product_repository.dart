import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/features/shop/domain/entities/product_filter.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({
    int page = 1,
    int limit = 20,
    ProductFilter? filter,
  });

  Future<Either<Failure, Product>> getProductById(String id);

  Future<Either<Failure, List<Product>>> searchProducts(String query);

  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String categoryId, {
        int page = 1,
        int limit = 20,
        ProductFilter? filter,
      });

  Future<Either<Failure, List<Product>>> getFeaturedProducts();
}
