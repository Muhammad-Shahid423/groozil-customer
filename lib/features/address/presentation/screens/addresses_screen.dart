import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/features/address/presentation/providers/address_notifier.dart';
import 'package:groozil_app/features/address/presentation/providers/address_state.dart';
import 'package:groozil_app/features/address/presentation/widgets/address_card.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_bar/custom_app_bar.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';

class AddressesScreen extends ConsumerWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressState = ref.watch(addressProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const CustomAppBar(title: 'My Addresses'),
      body: Column(
        children: [
          // Add New Address Button
          Container(
            color: Colors.white,
            padding: AppSizes.paddingL.padAll,
            child: ElevatedButton.icon(
              onPressed: NavigationService.goToAddAddress,
              icon: Icon(Icons.add, size: 20.sp),
              label: const Text('Add New Address'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceS),
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
                  padding: AppSizes.paddingL.padAll,
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    return AddressCard(
                      address: address,
                      onEdit: () {
                        NavigationService.goToEditAddress(address.id);
                      },
                      onDelete: () => _showDeleteConfirmation(
                        context,
                        ref,
                        address.id,
                      ),
                      onSetDefault: () async {
                        await ref
                            .read(addressProvider.notifier)
                            .setDefaultAddress(address.id);
                      },
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
                      size: 80.sp,
                      color: AppColors.error,
                    ),
                    SizedBox(height: AppSizes.spaceL),
                    Text(
                      'Error loading addresses',
                      style: AppTextStyles.light.semiBold18_24?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceS),
                    Text(
                      state.message,
                      style: AppTextStyles.light.regular14_17?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppSizes.spaceL),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(addressProvider.notifier).refresh();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: AppSizes.paddingL.padAll,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: AppSizes.paddingM.padB,
          child: ShimmerLoading(
            height: 180.h,
            width: double.infinity,
            borderRadius: AppSizes.radiusL,
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
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          SizedBox(height: AppSizes.spaceL),
          Text(
            'No addresses yet',
            style: AppTextStyles.light.semiBold18_24?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.spaceS),
          Text(
            'Add your first delivery address',
            style: AppTextStyles.light.regular14_17?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    String addressId,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Address'),
        content: const Text(
          'Are you sure you want to delete this address? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await ref.read(addressProvider.notifier).deleteAddress(addressId);
    }
  }
}
