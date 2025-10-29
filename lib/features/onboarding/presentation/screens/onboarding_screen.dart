import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/route_names.dart';
import 'package:groozil_app/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:groozil_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/buttons/app_button.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onboardingProvider);
    final pageController = PageController(initialPage: currentPage);

    final pages = <OnboardingData>[
      OnboardingData(
        title: LocaleKeys.onboarding_onboarding_1_title,
        subtitle: LocaleKeys.onboarding_onboarding_1_subtitle,
        description: LocaleKeys.onboarding_onboarding_1_description,
        imagePath: AssetsConstants.onBoard1,
      ),
      OnboardingData(
        title: LocaleKeys.onboarding_onboarding_2_title,
        subtitle: LocaleKeys.onboarding_onboarding_2_subtitle,
        description: LocaleKeys.onboarding_onboarding_2_description,
        imagePath: AssetsConstants.onBoard2,
      ),
      OnboardingData(
        title: LocaleKeys.onboarding_onboarding_3_title,
        subtitle: LocaleKeys.onboarding_onboarding_3_subtitle,
        description: LocaleKeys.onboarding_onboarding_3_description,
        imagePath: AssetsConstants.onBoard3,
      ),
    ];

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
            // Top section with logo, app name, and image
            Expanded(
              flex: 10,
              child: SafeArea(
                bottom: false,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    ref.read(onboardingProvider.notifier).setPage(index);
                  },
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(data: pages[index]);
                  },
                ),
              ),
            ),

            // Bottom white card with content
            Expanded(
              flex: 6,
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
                    padding: EdgeInsets.all(AppSizes.paddingXXL),
                    child: Column(
                      children: [
                        // Page indicators
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                            (index) => AnimatedContainer(
                              duration: AppSizes.animationMedium,
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              height: 8.h,
                              width: currentPage == index ? 40.w : 8.w,
                              decoration: BoxDecoration(
                                color: currentPage == index
                                    ? AppColors.primary
                                    : AppColors.primary.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
                              ),
                            ),
                          ),
                        ),
                        AppSizes.spaceXL.hBox,
                        Text(
                          context.tr(pages[currentPage].title),
                          style: AppTextStyles.light.semiBold24_30?.copyWith(
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        AppSizes.spaceS.hBox,
                        Text(
                          context.tr(pages[currentPage].subtitle),
                          style: AppTextStyles.light.semiBold20_25?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        AppSizes.spaceL.hBox,
                        Text(
                          context.tr(pages[currentPage].description),
                          style: AppTextStyles.light.regular16_20?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        const Spacer(),
                        AppButton.primary(
                          label: currentPage == 2
                              ? context.tr(LocaleKeys.common_get_started)
                              : context.tr(LocaleKeys.common_next),
                          onPressed: () async {
                            if (currentPage == 2) {
                              await ref.read(onboardingProvider.notifier).completeOnboarding();
                              if (context.mounted) {
                                context.go(RouteNames.authOptions);
                              }
                            } else {
                              unawaited(pageController.nextPage(
                                duration: AppSizes.animationMedium,
                                curve: Curves.easeInOut,
                              ));
                            }
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

class OnboardingData {

  OnboardingData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
}
