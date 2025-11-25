import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/features/auth/domain/entities/auth_response.dart';
import 'package:groozil_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> sendOtp({String? phone, String? email});
  Future<Either<Failure, AuthResponse>> verifyOtp({required String otp, String? phone, String? email});
  Future<Either<Failure, AuthResponse>> googleSignIn(String idToken);
  Future<Either<Failure, AuthResponse>> appleSignIn(String idToken);
  Future<Either<Failure, User>> updateProfile({required String name, String? phone, String? email});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> isLoggedIn();
  Future<Either<Failure, User?>> getCurrentUser();
}