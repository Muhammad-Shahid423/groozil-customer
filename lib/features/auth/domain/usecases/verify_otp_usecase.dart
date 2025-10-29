import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/auth/domain/entities/auth_response.dart';
import 'package:groozil_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VerifyOtpUseCase implements UseCase<AuthResponse, VerifyOtpParams> {

  VerifyOtpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthResponse>> call(VerifyOtpParams params) {
    return _repository.verifyOtp(
      phone: params.phone,
      email: params.email,
      otp: params.code,
    );
  }
}

class VerifyOtpParams extends Equatable {

  const VerifyOtpParams({
    this.phone,
    this.email,
    required this.code,
  });
  
  final String? phone;
  final String? email;
  final String code;

  @override
  List<Object?> get props => [phone, email, code];
}