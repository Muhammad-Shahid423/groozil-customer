import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class StockBadge extends StatelessWidget {

  const StockBadge({required this.inStock, super.key});
  final bool inStock;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: inStock
            ? AppColors.success.withOpacity(0.1)
            : AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            inStock ? Icons.check_circle : Icons.cancel,
            size: 16.sp,
            color: inStock ? AppColors.success : AppColors.error,
          ),
          4.wBox,
          Text(
            inStock ? 'In Stock' : 'Out of Stock',
            style: AppTextStyles.light.semiBold14_17?.copyWith(
              color: inStock ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
