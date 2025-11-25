import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class RatingBadge extends StatelessWidget {

  const RatingBadge({
    required this.rating,
    required this.reviewCount,
    super.key,
    this.compact = false,
  });
  final double rating;
  final int reviewCount;
  final bool compact;

  String get _formattedReviewCount {
    if (reviewCount >= 1000) {
      return '${(reviewCount / 1000).toStringAsFixed(1)}K';
    }
    return reviewCount.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              size: 14.sp,
              color: const Color(0xFFFFB800),
            ),
            SizedBox(width: 4.w),
            Text(
              rating.toStringAsFixed(1),
              style: AppTextStyles.light.semiBold12_15?.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 18.sp,
            color: const Color(0xFFFFB800),
          ),
          SizedBox(width: 4.w),
          Text(
            '${rating.toStringAsFixed(1)} ',
            style: AppTextStyles.light.semiBold16_20?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            '($_formattedReviewCount)',
            style: AppTextStyles.light.regular14_17?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
