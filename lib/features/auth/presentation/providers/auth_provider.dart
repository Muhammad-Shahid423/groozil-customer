import 'dart:developer';

import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/apple_sign_in_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:groozil_app/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:groozil_app/features/auth/presentation/providers/auth_state.dart';
import 'package:groozil_app/features/auth/presentation/providers/auth_usecase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthProvider extends _$AuthProvider {
  late final SendOtpUseCase _sendOtpUseCase;
  late final VerifyOtpUseCase _verifyOtpUseCase;
  late final GoogleSignInUseCase _googleSignInUseCase;
  late final AppleSignInUseCase _appleSignInUseCase;
  late final UpdateProfileUseCase _updateProfileUseCase;
  late final LogoutUseCase _logoutUseCase;
  late final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  late final GetCurrentUserUseCase _getCurrentUserUseCase;

  @override
  AuthState build() {
    _sendOtpUseCase           = ref.read(sendOtpUseCaseProvider);
    _verifyOtpUseCase         = ref.read(verifyOtpUseCaseProvider);
    _googleSignInUseCase      = ref.read(googleSignInUseCaseProvider);
    _appleSignInUseCase       = ref.read(appleSignInUseCaseProvider);
    _updateProfileUseCase     = ref.read(updateProfileUseCaseProvider);
    _logoutUseCase            = ref.read(logoutUseCaseProvider);
    _checkAuthStatusUseCase   = ref.read(checkAuthStatusUseCaseProvider);
    _getCurrentUserUseCase    = ref.read(getCurrentUserUseCaseProvider);

    // initial state
    return const AuthState.initial();
  }

  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();

    final result = await _checkAuthStatusUseCase(NoParams());

    result.fold(
          (failure) {
        state = const AuthState.unauthenticated();
      },
          (isLoggedIn) async {
        if (!isLoggedIn) {
          state = const AuthState.unauthenticated();
          return;
        }

        final userResult = await _getCurrentUserUseCase(NoParams());
        userResult.fold(
              (failure) {
            state = const AuthState.unauthenticated();
          },
              (user) {
            if (user != null) {
              state = AuthState.authenticated(user);
            } else {
              state = const AuthState.unauthenticated();
            }
          },
        );
      },
    );
  }

  Future<void> sendOtp({String? phone, String? email}) async {
    state = const AuthState.loading();

    final result = await _sendOtpUseCase(SendOtpParams(phone: phone, email: email));
    log(result.toString());

    result.fold(
          (failure) {
        state = AuthState.error(failure.message);
      },
          (_) {
        state = const AuthState.otpSent();
      },
    );
  }

  Future<void> verifyOtp({String? phone, String? email, required String otp}) async {
    state = const AuthState.loading();

    final result = await _verifyOtpUseCase(
      VerifyOtpParams(phone: phone, email: email, code: otp),
    );

    result.fold(
          (failure) {
        state = AuthState.error(failure.message);
      },
          (authResponse) {
        state = AuthState.authenticated(authResponse.user);
      },
    );
  }

  Future<void> googleSignIn(String idToken) async {
    state = const AuthState.loading();

    final result = await _googleSignInUseCase(idToken);

    result.fold(
          (failure) {
        state = AuthState.error(failure.message);
      },
          (authResponse) {
        state = AuthState.authenticated(authResponse.user);
      },
    );
  }

  Future<void> appleSignIn(String idToken) async {
    state = const AuthState.loading();

    final result = await _appleSignInUseCase(idToken);

    result.fold(
          (failure) {
        state = AuthState.error(failure.message);
      },
          (authResponse) {
        state = AuthState.authenticated(authResponse.user);
      },
    );
  }

  Future<void> updateProfile({
    required String name,
    String? phone,
    String? email,
  }) async {
    state = const AuthState.loading();

    final result = await _updateProfileUseCase(
      UpdateProfileParams(
        name: name,
        phone: phone,
        email: email,
      ),
    );

    result.fold(
          (failure) {
        state = AuthState.error(failure.message);
      },
          (authResponse) {
        state = AuthState.authenticated(authResponse.user);
      },
    );
  }

  Future<void> logout() async {
    state = const AuthState.loading();

    final result = await _logoutUseCase(NoParams());

    result.fold(
          (failure) {
        state = AuthState.error(failure.message);
      },
          (_) {
        state = const AuthState.unauthenticated();
      },
    );
  }
}
