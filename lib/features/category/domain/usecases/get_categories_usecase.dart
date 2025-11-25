import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/category/domain/entities/category_entity.dart';
import 'package:groozil_app/features/category/domain/repositories/category_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {

  GetCategoriesUseCase(this._repository);
  final CategoryRepository _repository;

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) {
    return _repository.getCategories();
  }
}
