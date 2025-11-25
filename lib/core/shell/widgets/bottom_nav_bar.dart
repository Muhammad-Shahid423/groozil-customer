import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/shell/widgets/bottom_nav_pills.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';
import 'package:groozil_app/shared/widgets/containers/app_gradient_container.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.selectedIndex,
    required this.onItemTap,
    required this.onCartTap,
    required this.safeAreaBottom,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemTap;
  final VoidCallback onCartTap;
  final double safeAreaBottom;

  static const Color _kPanel = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.r),
        topRight: Radius.circular(40.r),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 89,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _kPanel.withOpacity(0.8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 32),
              Expanded(
                child: BottomNavPills(
                  selectedIndex: selectedIndex,
                  onItemTap: onItemTap,
                ),
              ),
              SizedBox(width: AppSizes.paddingL),
              AppGradientContainer(
                onTap: onCartTap,
                child: const AppImage(path: AssetsConstants.cart),
              ),
              SizedBox(width: AppSizes.paddingXXXL),
            ],
          ),
        ),
      ),
    );
  }
}
