import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!.call();
        }
        NavigationService.goBack();
      },
      child: Container(
        height: 32.h,
        width: 32.w,
        padding: 8.padAll,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        child: AppImage(
          path: AssetsConstants.caretBack,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(context.theme.colorScheme.onSurface, BlendMode.srcIn),
        ),
      ),
    );
  }
}
