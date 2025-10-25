import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/app_constants.dart';
import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/routing/route_names.dart';
import 'package:groozil_app/core/services/storage/storage_service.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final storageService = getIt<StorageService>();
    final onboardingCompleted = storageService.getOnboardingCompleted();
    final token = storageService.getAccessToken();

    if (!onboardingCompleted) {
      NavigationService.goTo(RouteNames.onboarding);
    } else if (token != null && token.isNotEmpty) {
      NavigationService.goTo(RouteNames.home);
    } else {
      NavigationService.goTo(RouteNames.phoneInput);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo placeholder
            Container(
              width: 120.w,
              height: 120.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'G',
                  style: TextStyle(
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              AppConstants.appName,
              style: context.textStyles.bold32_40?.copyWith(
                color: Colors.white,
              ),
            ),
            8.hBox,
            Text(
              context.tr(LocaleKeys.splash_subtitle),
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40.h),
            CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3.w,
            ),
          ],
        ),
      ),
    );
  }
}