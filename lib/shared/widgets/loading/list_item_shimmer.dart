import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';

class ListItemShimmer extends StatelessWidget {
  const ListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingL,
        vertical: AppSizes.paddingM,
      ),
      child: Row(
        children: [
          ShimmerLoading(
            width: 60.w,
            height: 60.h,
            borderRadius: AppSizes.radiusM,
          ),
          SizedBox(width: AppSizes.paddingL),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoading(
                  width: double.infinity,
                  height: 16.h,
                  borderRadius: AppSizes.radiusS,
                ),
                SizedBox(height: AppSizes.spaceS),
                ShimmerLoading(
                  width: 120.w,
                  height: 14.h,
                  borderRadius: AppSizes.radiusS,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
