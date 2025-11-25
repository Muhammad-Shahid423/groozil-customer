import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    required this.address,
    required this.onEdit,
    required this.onDelete,
    required this.onSetDefault,
    this.isLoading = false,
    super.key,
  });

  final Address address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetDefault;
  final bool isLoading;

  IconData _getLabelIcon(String label) {
    switch (label.toLowerCase()) {
      case 'home':
        return Icons.home;
      case 'work':
      case 'office':
        return Icons.work;
      case 'hotel':
        return Icons.hotel;
      default:
        return Icons.location_on;
    }
  }

  Color _getLabelColor(String label) {
    switch (label.toLowerCase()) {
      case 'home':
        return Colors.blue;
      case 'work':
      case 'office':
        return Colors.orange;
      case 'hotel':
        return Colors.purple;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSizes.paddingM.padB,
      padding: AppSizes.paddingL.padAll,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        border: Border.all(
          color: address.isDefault ? AppColors.primary : Colors.grey.shade200,
          width: address.isDefault ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Label badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: _getLabelColor(address.label).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getLabelIcon(address.label),
                      size: 16.sp,
                      color: _getLabelColor(address.label),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      address.label,
                      style: AppTextStyles.light.semiBold12_15?.copyWith(
                        color: _getLabelColor(address.label),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Default badge
              if (address.isDefault)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSizes.radiusS),
                  ),
                  child: Text(
                    'Default',
                    style: AppTextStyles.light.semiBold12_15?.copyWith(
                      color: AppColors.primary,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: AppSizes.spaceM),
          // Address text
          Text(
            address.fullAddress,
            style: AppTextStyles.light.regular14_17?.copyWith(
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
          SizedBox(height: AppSizes.spaceL),
          // Action buttons
          Row(
            children: [
              // Edit button
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: isLoading ? null : onEdit,
                  icon: Icon(Icons.edit_outlined, size: 18.sp),
                  label: const Text('Edit'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppSizes.spaceM),
              // Delete button
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: isLoading ? null : onDelete,
                  icon: Icon(Icons.delete_outline, size: 18.sp),
                  label: const Text('Delete'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Set as default button
          if (!address.isDefault) ...[
            SizedBox(height: AppSizes.spaceS),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: isLoading ? null : onSetDefault,
                icon: Icon(Icons.check_circle_outline, size: 18.sp),
                label: const Text('Set as Default'),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
