import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/category/domain/entities/category_entity.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/containers/app_container.dart';

class CategoryTabs extends StatelessWidget {

  const CategoryTabs({
    required this.categories,
    required this.onCategorySelected,
    super.key,
    this.selectedCategoryId,
  });
  final List<CategoryEntity> categories;
  final String? selectedCategoryId;
  final Function(String?) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      margin: EdgeInsets.only(bottom: AppSizes.paddingM),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: AppSizes.paddingL.padL,
        children: [
          _buildTab(
            label: 'All',
            isSelected: selectedCategoryId == null,
            onTap: () => onCategorySelected(null),
          ),
          SizedBox(width: AppSizes.paddingS),
          ...categories.take(5).map((category) {
            return Padding(
              padding: AppSizes.paddingS.padR,
              child: _buildTab(
                label: category.getName('en'),
                icon: category.icon,
                isSelected: selectedCategoryId == category.id,
                onTap: () => onCategorySelected(category.id),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    String? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: (label == 'All' ? AppSizes.paddingL.padH : AppSizes.paddingXS.padH) +  2.padV,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: AppSizes.radiusCircle.rBox,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              AppContainer(
                height: 32,
                width: 32,
                padding: 4.padAll,
                color: AppColors.primary,
                child: Center(
                  child: Text(
                    icon,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
              // Text(
              //   icon,
              //   style: TextStyle(fontSize: 20.sp),
              // ),
              AppSizes.paddingXS.wBox,
            ],
            Text(
              label,
              style: AppTextStyles.light.medium14_17?.copyWith(
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
            ),
            2.wBox,
          ],
        ),
      ),
    );
  }
}
