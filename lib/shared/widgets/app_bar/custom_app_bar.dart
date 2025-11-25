import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar({
    required this.title,
    super.key,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.titleColor,
    this.elevation,
    this.centerTitle = true,
  });

  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? elevation;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: AppTextStyles.light.semiBold18_24?.copyWith(
          color: titleColor ?? AppColors.textPrimary,
        ),
      ),
      leading: leading ??
          (showBackButton
              ? IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textPrimary,
              size: AppSizes.iconS,
            ),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          )
              : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.appBarHeight);
}
