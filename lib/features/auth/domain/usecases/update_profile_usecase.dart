import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/auth/domain/entities/user.dart';
import 'package:groozil_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

class UpdateProfileParams {

  const UpdateProfileParams({
    required this.name,
    this.phone,
    this.email,
  });
  final String name;
  final String? phone;
  final String? email;
}

@injectable
class UpdateProfileUseCase implements UseCase<User, UpdateProfileParams> {
  UpdateProfileUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(UpdateProfileParams params) {
    return _repository.updateProfile(
      name: params.name,
      phone: params.phone,
      email: params.email,
    );
  }
}
