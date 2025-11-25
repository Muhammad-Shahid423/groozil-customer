import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/category/domain/entities/category_entity.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/containers/app_container.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({required this.categories, super.key});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final displayCategories = categories.take(8).toList();

    if (displayCategories.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: AppSizes.paddingL.padH + AppSizes.paddingM.padV,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.2),
            AppColors.secondary.withOpacity(0.2),
          ]
        ),
        borderRadius: AppSizes.radiusXL.rBox
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: AppSizes.paddingS,
          mainAxisSpacing: AppSizes.paddingM,
          childAspectRatio: 0.9,
        ),
        itemCount: displayCategories.length,
        itemBuilder: (context, index) {
          final category = displayCategories[index];
          return _buildCategoryItem(context, category);
        },
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, CategoryEntity category) {
    return GestureDetector(
      onTap: () async {
        // await NavigationService.pushTo('${RouteNames.shop}?categoryId=${category.id}');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: AppSizes.radiusCircle.rBox,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: AppContainer(
                height: 50.h,
                width: 50.w,
                color: Colors.white.withOpacity(0.6),
                padding: 8.padAll,
                // child: AppImage(path: category.iconPath),
                child: Center(
                  child: Text(
                    category.icon,
                    style: TextStyle(fontSize: 28.sp),
                  ),
                ),
              ),
            ),
          ),
          4.hBox,
          Expanded(
            child: Text(
              category.getName('en'),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.light.medium12_15?.copyWith(
                color: const Color(0xFF2D3648)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
