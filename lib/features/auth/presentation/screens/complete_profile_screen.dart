import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/utils/validators.dart';
import 'package:groozil_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:groozil_app/features/auth/presentation/providers/auth_state.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';
import 'package:groozil_app/shared/widgets/buttons/app_button.dart';
import 'package:groozil_app/shared/widgets/inputs/app_text_field.dart';
import 'package:groozil_app/shared/widgets/toast/app_toast.dart';

class CompleteProfileScreen extends ConsumerStatefulWidget {

  const CompleteProfileScreen({
    required this.loginType, super.key,
  });

  final String loginType;

  @override
  ConsumerState<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends ConsumerState<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool get _isEmailLogin => widget.loginType == 'email';

  Future<void> _completeProfile() async {
    if (_formKey.currentState?.validate() ?? false) {
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final fullName = '$firstName $lastName';

      final authController = ref.read(authProviderProvider.notifier);
      
      // Update based on login type
      if (!_isEmailLogin) {
        // Email login: send name + phone
        final phone = '+966${_phoneController.text.trim()}';
        await authController.updateProfile(name: fullName, phone: phone);
      } else {
        // Phone login: send name + email
        final email = _emailController.text.trim();
        await authController.updateProfile(name: fullName, email: email);
      }

      await ref.read(authProviderProvider).when(
        initial: () {},
        loading: () {},
        otpSent: () {},
        authenticated: (_) {
          if (mounted) {
            NavigationService.goToHome();
          }
        },
        unauthenticated: () {},
        error: (message) async {
          if (mounted) {
            await AppToast.show(
              context,
              message: message,
              type: ToastType.error,
            );
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
            const Expanded(
              flex: 2,
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    AppImage(
                      path: AssetsConstants.appLogoVertical,
                      height: 80,
                    ),
                    Spacer(),
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
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSizes.spaceL.hBox,
                            Text(
                              context.tr(LocaleKeys.auth_almost_there),
                              style: AppTextStyles.light.semiBold24_30?.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                            AppSizes.spaceS.hBox,
                            Text(
                              context.tr(LocaleKeys.auth_complete_profile_description),
                              style: AppTextStyles.light.regular16_20?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            AppSizes.spaceXL.hBox,
                            AppTextField(
                              controller: _firstNameController,
                              label: context.tr(LocaleKeys.auth_first_name),
                              hint: context.tr(LocaleKeys.auth_enter_first_name),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return context.tr(LocaleKeys.validation_required);
                                }
                                return null;
                              },
                              prefixIcon: const Icon(Icons.person_outline),
                              enabled: !isLoading,
                            ),
                            AppSizes.spaceL.hBox,
                            AppTextField(
                              controller: _lastNameController,
                              label: context.tr(LocaleKeys.auth_last_name),
                              hint: context.tr(LocaleKeys.auth_enter_last_name),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return context.tr(LocaleKeys.validation_required);
                                }
                                return null;
                              },
                              prefixIcon: const Icon(Icons.person_outline),
                              enabled: !isLoading,
                            ),
                            AppSizes.spaceL.hBox,
                            if (!_isEmailLogin)
                              AppTextField(
                                controller: _phoneController,
                                label: context.tr(LocaleKeys.auth_phone),
                                hint: context.tr(LocaleKeys.auth_enter_phone_number),
                                keyboardType: TextInputType.phone,
                                validator: Validators.validatePhone,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(AppSizes.paddingL),
                                  child: Text(
                                    '+966',
                                    style: AppTextStyles.light.medium16_20?.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                                enabled: !isLoading,
                              )
                            else
                              AppTextField(
                                controller: _emailController,
                                label: context.tr(LocaleKeys.auth_email),
                                hint: context.tr(LocaleKeys.auth_email_placeholder),
                                keyboardType: TextInputType.emailAddress,
                                validator: Validators.validateEmail,
                                prefixIcon: const Icon(Icons.email_outlined),
                                enabled: !isLoading,
                              ),
                            AppSizes.spaceXXL.hBox,
                            AppButton.primary(
                              label: context.tr(LocaleKeys.common_continue),
                              onPressed: isLoading ? null : _completeProfile,
                              isLoading: isLoading,
                            ),
                          ],
                        ),
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
