import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/home/domain/entities/banner_entity.dart';
import 'package:groozil_app/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBannersUseCase implements UseCase<List<BannerEntity>, NoParams> {

  GetBannersUseCase(this._repository);
  final HomeRepository _repository;

  @override
  Future<Either<Failure, List<BannerEntity>>> call(NoParams params) {
    return _repository.getBanners();
  }
}