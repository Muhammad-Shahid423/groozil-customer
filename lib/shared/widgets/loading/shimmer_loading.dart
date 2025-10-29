import 'package:flutter/material.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerLoading extends StatelessWidget {

  const ShimmerLoading({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.isCircle = false,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(milliseconds: 1500),
      interval: const Duration(milliseconds: 200),
      color: AppColors.shimmerHighlight.withOpacity(0.4),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle
              ? null
              : BorderRadius.circular(
            borderRadius ?? AppSizes.radiusM,
          ),
        ),
      ),
    );
  }
}
