import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/features/shop/domain/entities/product_filter.dart';
import 'package:groozil_app/features/shop/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductsByCategoryUseCase
    implements UseCase<List<Product>, GetProductsByCategoryParams> {

  GetProductsByCategoryUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, List<Product>>> call(
      GetProductsByCategoryParams params) {
    return _repository.getProductsByCategory(
      params.categoryId,
      page: params.page,
      limit: params.limit,
      filter: params.filter,
    );
  }
}

class GetProductsByCategoryParams extends Equatable {

  const GetProductsByCategoryParams({
    required this.categoryId,
    this.page = 1,
    this.limit = 20,
    this.filter,
  });
  final String categoryId;
  final int page;
  final int limit;
  final ProductFilter? filter;

  @override
  List<Object?> get props => [categoryId, page, limit, filter];
}
