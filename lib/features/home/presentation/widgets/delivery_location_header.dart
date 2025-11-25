import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/address/presentation/providers/address_notifier.dart';
import 'package:groozil_app/features/address/presentation/widgets/address_bottom_sheet.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/animations/app_animation.dart';
import 'package:groozil_app/shared/widgets/containers/app_container.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class DeliveryLocationHeader extends ConsumerWidget {
  const DeliveryLocationHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultAddress = ref.watch(addressProvider.notifier).getDefaultAddress();

    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.primary.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
          ),
          child: Center(
            child: Text(
              'G',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        AppSizes.paddingM.wBox,
        Expanded(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const AddressBottomSheet(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppAnimation(
                      assetPath: AssetsConstants.locationAnimation,
                      width: 24,
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.address_delivery_location.tr(),
                      style: AppTextStyles.light.regular12_15?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 16.sp,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
              if (defaultAddress != null)
                Text(
                  defaultAddress.shortAddress,
                  style: AppTextStyles.light.semiBold12_15?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
        Stack(
          children: [
            const AppContainer(
              child: AppImage(
                path: AssetsConstants.bell,
                fit: BoxFit.contain
              ),
            ),
            Positioned(
              top: 8,
              right: 10,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: context.theme.primaryColor
              ),
            )
          ],
        ),
      ],
    );
  }
}
