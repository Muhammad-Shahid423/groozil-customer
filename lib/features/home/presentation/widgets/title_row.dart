import 'package:flutter/material.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    required this.title,
    this.showViewAll = true,
    super.key,
    this.subtitle,
    this.onViewAllPressed,
  });
  final String title;
  final String? subtitle;
  final bool showViewAll;
  final VoidCallback? onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.paddingL.padH,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.light.semiBold18_24,
              ),
              if (subtitle != null)...[
                4.hBox,
                Text(
                  subtitle!,
                  style: AppTextStyles.light.regular14_17?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ]
            ],
          ),
          GestureDetector(
            onTap: onViewAllPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View All',
                  style: AppTextStyles.light.regular14_17?.copyWith(
                    color: context.theme.primaryColor,
                  ),
                ),
                5.wBox,
                Padding(
                  padding: 1.padT,
                  child: AppImage(
                    path: AssetsConstants.caretForward,
                    colorFilter: ColorFilter.mode(
                      context.theme.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
