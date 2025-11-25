import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/features/address/presentation/providers/address_notifier.dart';
import 'package:groozil_app/features/address/presentation/providers/address_state.dart';
import 'package:groozil_app/features/address/presentation/widgets/address_item.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class AddressBottomSheet extends ConsumerWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressState = ref.watch(addressProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Title and close button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.address_delivery_address.tr(),
                  style: AppTextStyles.light.bold18_24?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: AppColors.textPrimary,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),

          AppSizes.spaceM.hBox,

          // Map
          Container(
            height: 200.h,
            margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(25.2048, 55.2708), // Dubai coordinates
                  zoom: 12,
                ),
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
              ),
            ),
          ),

          AppSizes.spaceM.hBox,

          // Locate me button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
            child: OutlinedButton.icon(
              onPressed: () {
                // TODO: Implement locate me functionality
              },
              icon: Icon(
                Icons.my_location,
                size: 20.sp,
                color: AppColors.primary,
              ),
              label: Text(
                LocaleKeys.address_locate_me.tr(),
                style: AppTextStyles.light.medium14_17?.copyWith(
                  color: AppColors.primary,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                minimumSize: Size(double.infinity, 48.h),
              ),
            ),
          ),
          16.hBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.address_delivery_address.tr(),
                  style: AppTextStyles.light.semiBold14_17?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                TextButton.icon(
                  onPressed: NavigationService.goToAddAddress,
                  icon: Icon(
                    Icons.add,
                    size: 20.sp,
                    color: AppColors.primary,
                  ),
                  label: Text(
                    LocaleKeys.address_new_address.tr(),
                    style: AppTextStyles.light.medium12_15?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          8.hBox,
          Expanded(
            child: addressState.map(
              initial: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: (_) => _buildLoadingState(),
              loaded: (state) {
                final addresses = state.addresses;
                if (addresses.isEmpty) {
                  return _buildEmptyState(context);
                }

                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    final isSelected = address.isDefault;

                    return AddressItem(
                      address: address,
                      isSelected: isSelected,
                      onSetDefault: () async {
                        await ref
                            .read(addressProvider.notifier)
                            .setDefaultAddress(address.id);
                        // Navigator.pop(context);
                      }
                    );
                  },
                );
              },
              error: (state) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64.sp,
                      color: AppColors.error,
                    ),
                    AppSizes.spaceM.hBox,
                    Text(
                      LocaleKeys.address_error_loading_addresses.tr(),
                      style: AppTextStyles.light.semiBold14_17?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    AppSizes.spaceS.hBox,
                    Text(
                      state.message,
                      style: AppTextStyles.light.regular12_15?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppSizes.spaceL.hBox,
                    ElevatedButton(
                      onPressed: () {
                        ref.read(addressProvider.notifier).refresh();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: Text(LocaleKeys.common_retry.tr()),
                    ),
                  ],
                ),
              ),
            ),
          ),

          AppSizes.spaceM.hBox,
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: AppSizes.spaceM),
          padding: EdgeInsets.all(AppSizes.paddingM),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              AppSizes.spaceM.wBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    8.hBox,
                    Container(
                      width: double.infinity,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off_outlined,
            size: 80.sp,
            color: AppColors.textSecondary,
          ),
          AppSizes.spaceL.hBox,
          Text(
            LocaleKeys.address_no_addresses_saved.tr(),
            style: AppTextStyles.light.semiBold14_17?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          AppSizes.spaceS.hBox,
          Text(
            LocaleKeys.address_add_first_address.tr(),
            style: AppTextStyles.light.regular12_15?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
