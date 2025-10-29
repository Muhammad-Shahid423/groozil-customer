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

class PhoneLoginScreen extends ConsumerStatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  ConsumerState<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends ConsumerState<PhoneLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    if (_formKey.currentState?.validate() ?? false) {
      final phone = '+966${_phoneController.text.trim()}';
      final authController = ref.read(authProviderProvider.notifier);
      await authController.sendOtp(phone: phone);

      await ref.read(authProviderProvider).when(
        initial: () {},
        loading: () {},
        otpSent: () async {
          if (mounted) {
            await NavigationService.pushTo('${RouteNames.otpVerification}?phone=$phone');
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
                          AppSizes.spaceM.hBox,
                          Text(
                            context.tr(LocaleKeys.auth_enter_your_phone_number),
                            style: AppTextStyles.light.semiBold24_30?.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          AppSizes.spaceM.hBox,
                          Text(
                            context.tr(LocaleKeys.auth_we_will_send_code),
                            style: AppTextStyles.light.regular16_20?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          AppSizes.spaceXXL.hBox,
                          AppTextField(
                            controller: _phoneController,
                            label: context.tr(LocaleKeys.auth_phone),
                            hint: '5XXXXXXXX',
                            keyboardType: TextInputType.phone,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(AppSizes.paddingL),
                              child: Text(
                                '+966',
                                style: AppTextStyles.light.medium16_20?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            validator: Validators.validatePhone,
                            enabled: !isLoading,
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
