import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';

class AppSliderDots extends StatelessWidget {
  const AppSliderDots({
    required this.currentPage,
    required this.itemsLength,
    required this.onTap,
    super.key
  });
  final int currentPage;
  final int itemsLength;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemsLength, (index) {
        final isActive = index == currentPage;
        return GestureDetector(
          onTap: () {
            onTap(index);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: 4.padH,
            height: 5.h,
            width: isActive ? 30.w : 12.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  if (isActive) AppColors.primary else AppColors.typography200,
                  if (isActive) AppColors.secondary else AppColors.typography200
                ]
              ),
              borderRadius: 20.rBox,
            ),
          ),
        );
      }),
    );
  }
}
