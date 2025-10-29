import 'package:flutter/material.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({required this.data, super.key});
  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXXL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const AppImage(
            path: AssetsConstants.appLogoVertical,
            height: 84,
          ),
          AppSizes.spaceL.hBox,
          AppImage(
            path: data.imagePath,
            fit: BoxFit.contain,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
