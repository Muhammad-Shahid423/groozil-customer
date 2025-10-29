import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/features/auth/domain/usecases/apple_sign_in_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_usecase_providers.g.dart';

@riverpod
SendOtpUseCase sendOtpUseCase(Ref ref) {
  return getIt<SendOtpUseCase>();
}

@riverpod
VerifyOtpUseCase verifyOtpUseCase(Ref ref) {
  return getIt<VerifyOtpUseCase>();
}

@riverpod
GoogleSignInUseCase googleSignInUseCase(Ref ref) {
  return getIt<GoogleSignInUseCase>();
}

@riverpod
AppleSignInUseCase appleSignInUseCase(Ref ref) {
  return getIt<AppleSignInUseCase>();
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  return getIt<LogoutUseCase>();
}

@riverpod
CheckAuthStatusUseCase checkAuthStatusUseCase(Ref ref) {
  return getIt<CheckAuthStatusUseCase>();
}

@riverpod
GetCurrentUserUseCase getCurrentUserUseCase(Ref ref) {
  return getIt<GetCurrentUserUseCase>();
}

@riverpod
UpdateProfileUseCase updateProfileUseCase(Ref ref) {
  return getIt<UpdateProfileUseCase>();
}
