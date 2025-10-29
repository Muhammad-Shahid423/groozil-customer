import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckAuthStatusUseCase implements UseCase<bool, NoParams> {

  CheckAuthStatusUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _repository.isLoggedIn();
  }
}