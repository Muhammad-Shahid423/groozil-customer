import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/auth/domain/entities/auth_response.dart';
import 'package:groozil_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

class UpdateProfileParams {
  final String name;
  final String? phone;
  final String? email;

  const UpdateProfileParams({
    required this.name,
    this.phone,
    this.email,
  });
}

@injectable
class UpdateProfileUseCase implements UseCase<AuthResponse, UpdateProfileParams> {
  UpdateProfileUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthResponse>> call(UpdateProfileParams params) {
    return _repository.updateProfile(
      name: params.name,
      phone: params.phone,
      email: params.email,
    );
  }
}
