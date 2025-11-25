import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.isDisabled = false,
    this.height = 53,
    this.borderRadius = 100,
    this.borderColor,
    this.backgroundColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.icon,
    this.preFix,
    this.width,
  });

  factory AppButton.primary({
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isDisabled = false,
    String? preFix,
    TextStyle? textStyle,
  }) {
    return AppButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      isDisabled: isDisabled,
      backgroundColor: AppColors.primary500,
      borderColor: Colors.transparent,
      textStyle: textStyle ?? AppTextStyles.light.bold14_17?.copyWith(color: Colors.white),
      preFix: preFix,
    );
  }

  // Outline / secondary (like "Continue with email")
  factory AppButton.outline({
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isDisabled = false,
    Color borderColor = AppColors.textPrimary,
  }) {
    return AppButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      isDisabled: isDisabled,
      backgroundColor: Colors.transparent,
      borderColor: borderColor,
      textStyle: AppTextStyles.light.bold14_17?.copyWith(color: AppColors.textPrimary),
    );
  }

  // Provider / Google
  factory AppButton.google({
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isDisabled = false,
  }) {
    return AppButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      isDisabled: isDisabled,
      backgroundColor: Colors.transparent,
      borderColor: AppColors.textPrimary,
      textStyle: AppTextStyles.light.bold14_17?.copyWith(color: AppColors.textPrimary),
      preFix: AssetsConstants.google,
    );
  }

  // Provider / Apple
  factory AppButton.apple({
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isDisabled = false,
  }) {
    return AppButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      isDisabled: isDisabled,
      backgroundColor: Colors.black,
      borderColor: Colors.transparent,
      textStyle: AppTextStyles.light.bold14_17?.copyWith(color: Colors.white),
      preFix: AssetsConstants.apple,
    );
  }

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final double height;
  final double borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final IconData? icon;
  final String? preFix;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final isBusy = isLoading;
    final buttonDisabled = isDisabled || isBusy || onPressed == null;

    // Resolve base visuals
    final resolvedBg = buttonDisabled
        ? Colors.grey
        : (backgroundColor ?? context.theme.primaryColor);

    final resolvedBorder = borderColor ?? Colors.transparent;

    final baseTextStyle = textStyle ?? AppTextStyles.light.regular16_20!;
    final resolvedTextColor = baseTextStyle.color ?? Colors.white;

    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: buttonDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: resolvedBg,
          foregroundColor: resolvedTextColor,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: resolvedTextColor.withOpacity(0.5),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: resolvedBorder),
          ),
        ),
        child: isBusy
            ? SizedBox(
          height: 20.h,
          width: 20.w,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (preFix != null) ...[
              AppImage(
                path: preFix!,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(resolvedTextColor, BlendMode.srcIn),
              ),
              8.wBox,
            ],
            Text(
              label,
              style: baseTextStyle.copyWith(
                color: resolvedTextColor,
              ),
            ),
            if (icon != null) ...[
              8.wBox,
              Icon(
                icon,
                size: 20,
                color: resolvedTextColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
