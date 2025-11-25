import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/features/home/presentation/widgets/title_row.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:groozil_app/features/wishlist/presentation/providers/wishlist_notifier.dart';
import 'package:groozil_app/features/wishlist/presentation/providers/wishlist_state.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/product/product_card.dart';

class FavoritesSection extends ConsumerWidget {
  const FavoritesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistState = ref.watch(wishlistProvider);

    return wishlistState.maybeWhen(
      loaded: (WishlistEntity wishlist) {
        // Don't show section if no favorites
        if (wishlist.items.isEmpty) {
          return const SizedBox.shrink();
        }

        // Get products from wishlist items (max 10)
        final favoriteProducts = wishlist.items
            .where((item) => item.product != null)
            .take(10)
            .map((item) => item.product!)
            .toList();

        if (favoriteProducts.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleRow(
              title: 'Your Favorites',
              onViewAllPressed: NavigationService.goToWishlist,
            ),
            SizedBox(height: AppSizes.spaceM),
            SizedBox(
              height: 220.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: AppSizes.paddingL.padH,
                itemCount: favoriteProducts.length,
                separatorBuilder: (context, index) => SizedBox(width: AppSizes.paddingM),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 160.w,
                    child: ProductCard(
                      product: favoriteProducts[index],
                      enableHero: false, // Disable hero in horizontal list to avoid conflicts
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: _buildLoadingState,
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _buildLoadingState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppSizes.paddingL.padH,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Favorites',
                    style: AppTextStyles.light.semiBold20_25?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Loading...',
                    style: AppTextStyles.light.regular14_17?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSizes.spaceM),
        SizedBox(
          height: 220.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppSizes.paddingL.padH,
            itemCount: 3,
            separatorBuilder: (context, index) => SizedBox(width: AppSizes.paddingM),
            itemBuilder: (context, index) {
              return Container(
                width: 160.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(AppSizes.radiusL),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
