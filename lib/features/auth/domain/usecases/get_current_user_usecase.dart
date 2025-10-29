import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/auth/domain/entities/user.dart';
import 'package:groozil_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrentUserUseCase implements UseCase<User?, NoParams> {

  GetCurrentUserUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, User?>> call(NoParams params) {
    return _repository.getCurrentUser();
  }
}