import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/routing/route_names.dart';
import 'package:groozil_app/core/utils/validators.dart';
import 'package:groozil_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:groozil_app/features/auth/presentation/providers/auth_state.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';
import 'package:groozil_app/shared/widgets/buttons/app_back_button.dart';
import 'package:groozil_app/shared/widgets/buttons/app_button.dart';
import 'package:groozil_app/shared/widgets/inputs/app_text_field.dart';
import 'package:groozil_app/shared/widgets/toast/app_toast.dart';

class EmailLoginScreen extends ConsumerStatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  ConsumerState<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends ConsumerState<EmailLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final authController = ref.read(authProviderProvider.notifier);
      await authController.sendOtp(email: email);

      await ref.read(authProviderProvider).when(
        initial: () {},
        loading: () {},
        otpSent: () async {
          if (mounted) {
            await NavigationService.pushTo('${RouteNames.otpVerification}?email=$email');
          }
        },
        authenticated: (_) {},
        unauthenticated: () {},
        error: (message) async {
          if (mounted) {
            await AppToast.show(context, message: message, type: ToastType.error);
          }
        },
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSizes.spaceL.hBox,
                          Text(
                            context.tr(LocaleKeys.auth_welcome_back),
                            style: AppTextStyles.light.semiBold24_30?.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          AppSizes.spaceM.hBox,
                          Text(
                            context.tr(LocaleKeys.auth_sign_in_to_continue),
                            style: AppTextStyles.light.regular16_20?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          AppSizes.spaceXXL.hBox,
                          AppTextField(
                            controller: _emailController,
                            label: context.tr(LocaleKeys.auth_email),
                            hint: context.tr(LocaleKeys.auth_email_placeholder),
                            keyboardType: TextInputType.emailAddress,
                            validator: Validators.validateEmail,
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          const Spacer(),
                          AppButton.primary(
                            label: context.tr(LocaleKeys.common_continue),
                            onPressed: isLoading ? null : _sendOtp,
                            isLoading: isLoading,
                          ),
                        ],
                      ),
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
