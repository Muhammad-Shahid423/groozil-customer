import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingM),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoading(
            width: double.infinity,
            height: 120.h,
            borderRadius: AppSizes.radiusM,
          ),
          SizedBox(height: AppSizes.spaceM),
          ShimmerLoading(
            width: 100.w,
            height: 16.h,
            borderRadius: AppSizes.radiusS,
          ),
          SizedBox(height: AppSizes.spaceS),
          ShimmerLoading(
            width: 80.w,
            height: 14.h,
            borderRadius: AppSizes.radiusS,
          ),
          SizedBox(height: AppSizes.spaceM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerLoading(
                width: 60.w,
                height: 20.h,
                borderRadius: AppSizes.radiusS,
              ),
              ShimmerLoading(
                width: 40.w,
                height: 40.h,
                borderRadius: AppSizes.radiusCircle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
