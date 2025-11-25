import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:groozil_app/features/wishlist/presentation/providers/wishlist_notifier.dart';
import 'package:groozil_app/features/wishlist/presentation/providers/wishlist_state.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_bar/custom_app_bar.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';
import 'package:groozil_app/shared/widgets/product/product_card.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistState = ref.watch(wishlistProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsConstants.appBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SafeArea(
              bottom: false,
              child: CustomAppBar(title: 'My Wishlist'),
            ),
            SizedBox(height: AppSizes.spaceL),
            Expanded(
              child: wishlistState.maybeWhen(
                initial: _buildEmptyState,
                loading: _buildLoadingState,
                loaded: (WishlistEntity wishlist) {
                  if (wishlist.items.isEmpty) {
                    return _buildEmptyState();
                  }

                  // Filter out items where product is null
                  final validItems = wishlist.items
                      .where((WishlistItem item) => item.product != null)
                      .toList();

                  if (validItems.isEmpty) {
                    return _buildEmptyState();
                  }

                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.radiusBottomSheet),
                      topRight: Radius.circular(AppSizes.radiusBottomSheet),
                    ),
                    child: Container(
                      padding: AppSizes.paddingL.padH,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      child: SafeArea(
                        top: false,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: AppSizes.paddingM,
                            mainAxisSpacing: AppSizes.paddingM,
                            childAspectRatio: 0.68, // Adjust based on card height
                          ),
                          padding: AppSizes.paddingL.padV,
                          physics: const ClampingScrollPhysics(),
                          itemCount: validItems.length,
                          itemBuilder: (context, index) {
                            final product = validItems[index].product!;
                            return ProductCard(
                              product: product,
                              enableHero: false, // Disable hero in wishlist grid to avoid conflicts
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
                error: (String message) => Center(
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
                        'Error loading wishlist',
                        style: AppTextStyles.light.semiBold20_25?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: AppSizes.spaceS),
                      Text(
                        message,
                        style: AppTextStyles.light.regular14_17?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSizes.spaceL),
                      ElevatedButton(
                        onPressed: () => ref.read(wishlistProvider.notifier).refresh(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                orElse: _buildEmptyState,
              ),
            )
          ],
        )
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80.sp,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          SizedBox(height: AppSizes.spaceL),
          Text(
            'No favorites yet',
            style: AppTextStyles.light.semiBold20_25?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.spaceS),
          Text(
            'Start adding products to your wishlist',
            style: AppTextStyles.light.regular14_17?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: AppSizes.paddingL.padH + AppSizes.paddingM.padT,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSizes.paddingM,
          mainAxisSpacing: AppSizes.paddingM,
          childAspectRatio: 0.68,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerLoading(
            height: 280.h,
            width: double.infinity,
            borderRadius: AppSizes.radiusL,
          );
        },
      ),
    );
  }
}
