import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/home/presentation/providers/featured_products_provider.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_bar/custom_app_bar.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';
import 'package:groozil_app/shared/widgets/product/product_card.dart';

class FeaturedProductsScreen extends ConsumerWidget {
  const FeaturedProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredProductsAsync = ref.watch(featuredProductsProvider);

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
              child: CustomAppBar(title: 'Featured Products'),
            ),
            SizedBox(height: AppSizes.spaceL),
            Expanded(
              child: featuredProductsAsync.when(
                loading: _buildLoadingState,
                error: (error, stack) => _buildErrorState(error.toString(), ref),
                data: (products) {
                  if (products.isEmpty) {
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
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductCard(
                              product: product,
                              enableHero: false, // Disable hero in grid
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_border,
            size: 80.sp,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          SizedBox(height: AppSizes.spaceL),
          Text(
            'No Featured Products',
            style: AppTextStyles.light.semiBold20_25?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.spaceS),
          Text(
            'Check back later for new featured products',
            style: AppTextStyles.light.regular14_17?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message, WidgetRef ref) {
    return Center(
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
            'Error loading products',
            style: AppTextStyles.light.semiBold20_25?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.spaceS),
          Padding(
            padding: AppSizes.paddingL.padH,
            child: Text(
              message,
              style: AppTextStyles.light.regular14_17?.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: AppSizes.spaceL),
          ElevatedButton(
            onPressed: () => ref.refresh(featuredProductsProvider),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
            ),
            child: const Text('Retry'),
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
