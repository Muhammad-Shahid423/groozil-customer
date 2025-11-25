import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    required this.address,
    required this.isSelected,
    required this.onSetDefault,
    super.key
  });

  final Address address;
  final bool isSelected;
  // final VoidCallback onEdit;
  // final VoidCallback onDelete;
  final VoidCallback onSetDefault;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSetDefault,
      child: Container(
        margin: 8.padB,
        padding: 8.padAll,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.05)
              : Colors.grey.shade50,
          borderRadius: 12.rBox,
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: 8.padAll,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: 8.rBox,
              ),
              child: Icon(
                address.label.toLowerCase() == 'home'
                    ? Icons.home_outlined
                    : address.label.toLowerCase() == 'work'
                    ? Icons.work_outline
                    : Icons.location_on_outlined,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.textSecondary,
                size: 24.sp,
              ),
            ),
            8.wBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        address.label,
                        style: AppTextStyles
                            .light.semiBold14_17
                            ?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (isSelected) ...[
                        4.wBox,
                        Icon(
                          Icons.check_circle,
                          color: AppColors.primary,
                          size: 18.sp,
                        ),
                      ],
                    ],
                  ),
                  4.hBox,
                  Text(
                    '${address.building}, ${address.street}',
                    style: AppTextStyles.light.regular12_15
                        ?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            12.wBox,
            // Edit button
            IconButton(
              onPressed: () {
                NavigationService.goToEditAddress(
                  address.id,
                  address: address,
                );
              },
              icon: Icon(
                Icons.edit_outlined,
                color: AppColors.textSecondary,
                size: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
