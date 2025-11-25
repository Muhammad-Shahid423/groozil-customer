import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/home/presentation/providers/featured_products_provider.dart';
import 'package:groozil_app/features/home/presentation/widgets/title_row.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';
import 'package:groozil_app/shared/widgets/product/product_card.dart';

class FeaturedProductsSection extends ConsumerWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredProductsAsync = ref.watch(featuredProductsProvider);

    return featuredProductsAsync.when(
      loading: _buildLoadingState,
      error: (error, stack) => const SizedBox.shrink(),
      data: (products) {
        if (products.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleRow(
              title: 'Featured Products',
              // onViewAllPressed: NavigationService.goToFeaturedProducts,
              onViewAllPressed: () {},
            ),
            SizedBox(height: AppSizes.spaceM),
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: AppSizes.paddingL.padH,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index != products.length - 1 ? AppSizes.paddingM : 0,
                    ),
                    child: SizedBox(
                      width: 160.w,
                      child: ProductCard(
                        product: product,
                        enableHero: false, // Disable hero in horizontal list
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppSizes.paddingL.padH,
          child: ShimmerLoading(
            height: 24.h,
            width: 180.w,
            borderRadius: AppSizes.radiusM,
          ),
        ),
        SizedBox(height: AppSizes.spaceM),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: AppSizes.paddingL.padH,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index != 4 ? AppSizes.paddingM : 0,
                ),
                child: ShimmerLoading(
                  height: 280.h,
                  width: 160.w,
                  borderRadius: AppSizes.radiusL,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
