import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/features/shop/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchProductsUseCase implements UseCase<List<Product>, String> {

  SearchProductsUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, List<Product>>> call(String query) {
    return _repository.searchProducts(query);
  }
}
