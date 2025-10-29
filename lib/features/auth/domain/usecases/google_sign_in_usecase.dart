import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/auth/domain/entities/auth_response.dart';
import 'package:groozil_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GoogleSignInUseCase implements UseCase<AuthResponse, String> {

  GoogleSignInUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthResponse>> call(String idToken) {
    return _repository.googleSignIn(idToken);
  }
}
