import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/routing/route_names.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';
import 'package:groozil_app/shared/widgets/buttons/app_button.dart';

class AuthOptionsScreen extends StatelessWidget {
  const AuthOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              flex: (0.5679 * 10000).round(),
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const AppImage(
                      path: AssetsConstants.appLogoVertical,
                      height: 80,
                    ),
                    AppSizes.spaceXXL.hBox,
                    const AppImage(
                      path: AssetsConstants.onBoard4,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: (0.4621 * 10000).round(),
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
                    padding: AppSizes.paddingXL.padH,
                    child: Column(
                      children: [
                        AppSizes.spaceM.hBox,
                        Container(
                          height: 4.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: context.theme.dividerColor,
                            borderRadius: 8.rBox,
                          ),
                        ),
                        AppSizes.spaceXL.hBox,
                        AppButton.primary(
                          label: context.tr(LocaleKeys.auth_continue_with_phone),
                          onPressed: () async {
                            await NavigationService.pushTo(RouteNames.phoneInput);
                          },
                        ),
                        AppSizes.spaceL.hBox,
                        AppButton.outline(
                          label: context.tr(LocaleKeys.auth_continue_with_email),
                          onPressed: () async {
                            await NavigationService.pushTo(RouteNames.emailInput);
                          },
                        ),
                        AppSizes.spaceXL.hBox,
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: AppColors.divider,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                              child: Text(
                                context.tr(LocaleKeys.auth_or),
                                style: AppTextStyles.light.regular14_17?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: AppColors.divider,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        AppSizes.spaceXL.hBox,
                        AppButton.google(
                          label: context.tr(LocaleKeys.auth_continue_with_google),
                          onPressed: () {
                            // TODO: Implement Google Sign-In
                          },
                        ),
                        AppSizes.spaceL.hBox,
                        AppButton.apple(
                          label: context.tr(LocaleKeys.auth_continue_with_apple),
                          onPressed: () {
                            // TODO: Implement Apple Sign-In
                          },
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
