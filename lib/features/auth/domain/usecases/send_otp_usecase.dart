import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

class SendOtpParams {
  const SendOtpParams({this.phone, this.email});
  
  final String? phone;
  final String? email;
}

@lazySingleton
class SendOtpUseCase implements UseCase<void, SendOtpParams> {

  SendOtpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(SendOtpParams params) {
    return _repository.sendOtp(phone: params.phone, email: params.email);
  }
}

