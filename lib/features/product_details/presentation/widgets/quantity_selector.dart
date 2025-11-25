import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class QuantitySelector extends StatelessWidget {

  const QuantitySelector({
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
    super.key,
    this.maxQuantity,
  });
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final int? maxQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 4.padAll,
      decoration: BoxDecoration(
        color: AppColors.backgroundGray,
        borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            icon: AssetsConstants.minus,
            onTap: onDecrement,
            enabled: quantity > 1,
            context: context,
          ),
          Container(
            constraints: BoxConstraints(minWidth: 40.w),
            padding: AppSizes.paddingM.padH,
            child: Text(
              quantity.toString().padLeft(2, '0'),
              style: AppTextStyles.light.semiBold20_25?.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          _buildButton(
            icon: AssetsConstants.plus,
            onTap: onIncrement,
            enabled: maxQuantity == null || quantity < maxQuantity!,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String icon,
    required VoidCallback onTap,
    required bool enabled,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: enabled ? context.theme.cardColor : AppColors.disabled,
          shape: BoxShape.circle,
        ),
        child: AppImage(
          path: icon,
          width: 20.w,
          height: 20.h,
          fit: BoxFit.none,
          colorFilter: enabled
              ? const ColorFilter.mode(AppColors.textDark, BlendMode.srcIn)
              : const ColorFilter.mode(AppColors.disabled, BlendMode.srcIn),
        ),
      ),
    );
  }
}
