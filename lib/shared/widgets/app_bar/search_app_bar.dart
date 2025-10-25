import 'package:flutter/material.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {

  const SearchAppBar({
    required this.title,
    super.key,
    this.onSearchTap,
    this.actions,
  });

  final String title;
  final VoidCallback? onSearchTap;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: Text(
        title,
        style: AppTextStyles.light.semiBold18_24?.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: AppColors.textPrimary,
            size: AppSizes.iconM,
          ),
          onPressed: onSearchTap,
        ),
        ...?actions,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.appBarHeight);
}
