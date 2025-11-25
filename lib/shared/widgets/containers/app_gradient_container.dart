import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';

class AppGradientContainer extends StatelessWidget {
  const AppGradientContainer({
    required this.onTap,
    required this.child,
    this.primary = AppColors.primary,
    this.secondary = AppColors.secondary,
    this.height = 55,
    this.width = 55,
    this.padding,
    super.key,
  });

  final VoidCallback onTap;
  final Color primary;
  final Color secondary;
  final Widget child;
  final double height;
  final double width;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        height: height.h,
        width: width.h,
        padding: padding ?? 16.padAll,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [secondary, primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: child,
      ),
    );
  }
}
