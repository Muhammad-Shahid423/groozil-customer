import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/features/cart/presentation/providers/cart_counter_notifier.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/features/wishlist/presentation/providers/wishlist_notifier.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/containers/app_container.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';
import 'package:groozil_app/shared/widgets/containers/app_gradient_container.dart';
import 'package:groozil_app/shared/widgets/product/rating_badge.dart';

class ProductCard extends ConsumerWidget {

  const ProductCard({
    required this.product,
    this.heroTagSuffix,
    this.enableHero = true,
    super.key,
  });
  final Product product;
  final String? heroTagSuffix;
  final bool enableHero;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInWishlist = ref.watch(isInWishlistProvider(product.id));

    return GestureDetector(
      onTap: () async {
        await NavigationService.goToProductDetails(
          product.id,
          product: product, // Pass product for instant loading
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppSizes.radiusL.rBox,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Conditionally wrap with Hero
                if (enableHero)
                  Hero(
                    tag: heroTagSuffix != null 
                        ? 'product-image-${product.id}-$heroTagSuffix'
                        : 'product-image-${product.id}',
                    child: AppImage(
                      height: 120,
                      width: double.infinity,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSizes.radiusL),
                        topRight: Radius.circular(AppSizes.radiusL),
                      ),
                      path: product.primaryImage,
                    ),
                  )
                else
                  AppImage(
                    height: 120,
                    width: double.infinity,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.radiusL),
                      topRight: Radius.circular(AppSizes.radiusL),
                    ),
                    path: product.primaryImage,
                  ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: AppContainer(
                    height: 32,
                    width: 32,
                    padding: 0.padAll,
                    onTap: () {
                      ref.read(wishlistProvider.notifier).toggleWishlist(product.id);
                    },
                    child: Center(
                      child: Icon(
                        isInWishlist ? Icons.favorite : Icons.favorite_border,
                        size: 18.sp,
                        color: isInWishlist ? AppColors.error : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
                if (product.rating > 0)
                  Positioned(
                    bottom: 8.h,
                    left: 8.w,
                    child: RatingBadge(
                      rating: product.rating,
                      reviewCount: product.reviewCount,
                      compact: true,
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: AppSizes.paddingS.padH + AppSizes.paddingXS.padT
                    + 8.padB,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.getName('en'),
                      style: AppTextStyles.light.medium14_17?.copyWith(
                        // color: AppColors.textPrimary,
                        color: const Color(0xFF2D3648),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.hBox,
                    Text(
                      product.unit,
                      style: AppTextStyles.light.regular12_15?.copyWith(
                        color: AppColors.textOnSecondary,
                      ),
                    ),

                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SAR ${product.price.toStringAsFixed(1)}',
                              style: AppTextStyles.light.medium16_20?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            if (product.hasDiscount)
                              Text(
                                'SAR ${product.comparePrice!.toStringAsFixed(1)}',
                                style: AppTextStyles.light.medium16_20?.copyWith(
                                  color: AppColors.textHint,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                        AppGradientContainer(
                          onTap: () {
                            if (!product.inStock) return;
                            ref.read(cartCounterProvider.notifier).increment();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${product.getName('en')} added to cart',
                                ),
                                backgroundColor: AppColors.success,
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          height: 30,
                          width: 30,
                          padding: 8.padAll,
                          child: const AppImage(
                            path: AssetsConstants.plus,
                            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
