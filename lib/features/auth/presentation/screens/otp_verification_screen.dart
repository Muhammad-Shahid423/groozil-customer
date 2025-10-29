import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/extensions/type_checkers.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/routing/route_names.dart';
import 'package:groozil_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:groozil_app/features/auth/presentation/providers/auth_state.dart';
import 'package:groozil_app/features/auth/presentation/widgets/otp_input_field.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';
import 'package:groozil_app/shared/widgets/buttons/app_back_button.dart';
import 'package:groozil_app/shared/widgets/buttons/app_button.dart';
import 'package:groozil_app/shared/widgets/toast/app_toast.dart';

class OtpVerificationScreen extends ConsumerStatefulWidget {

  const OtpVerificationScreen({
    this.phone, 
    this.email,
    super.key,
  }) : assert(phone != null || email != null, 'Either phone or email must be provided');

  final String? phone;
  final String? email;

  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final List<TextEditingController> _otpControllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(6, (index) => FocusNode());

  int _remainingSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final controller in _otpControllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _remainingSeconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _getOtp() {
    return _otpControllers.map((controller) => controller.text).join();
  }

  Future<void> _verifyOtp() async {
    final otp = _getOtp();
    if (otp.length == 6) {
      final authController = ref.read(authProviderProvider.notifier);
      await authController.verifyOtp(
        phone: widget.phone != null ? '+${widget.phone!.trimLeft()}' : null,
        email: widget.email,
        otp: otp,
      );

      await ref.read(authProviderProvider).when(
        initial: () {},
        loading: () {},
        otpSent: () {},
        authenticated: (user) {
          if (mounted) {
            // Check if user has completed their profile (has a name)
            if (user.name.isNullOrEmpty) {
              // Navigate to complete profile screen with login method info
              // Pass which field is missing (phone or email)
              final missingField = user.phone.isNullOrEmpty ? 'phone' : 'email';
              NavigationService.goTo('${RouteNames.profileSetup}?type=$missingField');
            } else {
              // User profile is complete, go to home
              NavigationService.goToHome();
            }
          }
        },
        unauthenticated: () {},
        error: (message) async {
          if (mounted) {
            await AppToast.show(context, message: message, type: ToastType.error);
          }
        },
      );
    }
  }

  Future<void> _resendOtp() async {
    await ref.read(authProviderProvider.notifier).sendOtp(
      phone: widget.phone != null ? '+${widget.phone!.trimLeft()}' : null,
      email: widget.email,
    );
    _startTimer();

    if (mounted) {
      await AppToast.show(
        context,
        message: context.tr(LocaleKeys.auth_otp_sent_successfully),
        type: ToastType.success
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProviderProvider);
    final isLoading = authState == const AuthState.loading();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsConstants.appBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SafeArea(
                bottom: false,
                child: Stack(
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppImage(
                              path: AssetsConstants.appLogoVertical,
                              height: 80,
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    Positioned(
                      left: AppSizes.paddingL.w,
                      top: AppSizes.paddingM.h,
                      child: const AppBackButton(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.radiusBottomSheet),
                    topRight: Radius.circular(AppSizes.radiusBottomSheet),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.paddingXL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AppSizes.spaceL.hBox,
                        AppBackButton(),
                        AppSizes.spaceL.hBox,
                        Text(
                          context.tr(LocaleKeys.auth_enter_verification_code),
                          style: AppTextStyles.light.semiBold24_30?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        AppSizes.spaceM.hBox,
                        Text(
                          '${context.tr(LocaleKeys.auth_we_sent_code_to)} ${widget.phone ?? widget.email}',
                          style: AppTextStyles.light.regular16_20?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        AppSizes.spaceXXL.hBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            6,
                            (index) => OtpInputField(
                              controller: _otpControllers[index],
                              focusNode: _focusNodes[index],
                              onChanged: (value) async {
                                if (value.length == 1 && index < 5) {
                                  _focusNodes[index + 1].requestFocus();
                                } else if (value.isEmpty && index > 0) {
                                  _focusNodes[index - 1].requestFocus();
                                }

                                // Auto-verify when all fields are filled
                                if (index == 5 && value.length == 1) {
                                  await _verifyOtp();
                                }
                              },
                            ),
                          ),
                        ),
                        AppSizes.spaceXXL.hBox,
                        Center(
                          child: _remainingSeconds > 0
                              ? Text(
                                  context.tr(LocaleKeys.auth_resend_code_in,
                                      namedArgs: {'seconds': _remainingSeconds.toString()}),
                                  style: AppTextStyles.light.regular14_17?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                )
                              : TextButton(
                                  onPressed: isLoading ? null : _resendOtp,
                                  child: Text(
                                    context.tr(LocaleKeys.auth_resend_otp),
                                    style: AppTextStyles.light.semiBold14_17?.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                        ),
                        const Spacer(),
                        AppButton.primary(
                          label: context.tr(LocaleKeys.auth_verify),
                          onPressed: isLoading ? null : _verifyOtp,
                          isLoading: isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}