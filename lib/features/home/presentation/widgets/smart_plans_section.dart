import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/home/presentation/widgets/title_row.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class SmartPlansSection extends StatelessWidget {
  const SmartPlansSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          title: 'Smart Grocery Plans',
          onViewAllPressed: () {},
        ),
        SizedBox(height: AppSizes.spaceM),
        Container(
          height: 160.h,
          margin: AppSizes.paddingL.padH,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary.withOpacity(0.1),
                AppColors.secondary.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusXL),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.2),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 40.sp,
                  color: AppColors.primary,
                ),
                SizedBox(height: AppSizes.spaceM),
                Text(
                  'Coming Soon',
                  style: AppTextStyles.light.semiBold16_20?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: AppSizes.spaceS),
                Text(
                  'Smart grocery plans to save time & money',
                  style: AppTextStyles.light.regular14_17?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
