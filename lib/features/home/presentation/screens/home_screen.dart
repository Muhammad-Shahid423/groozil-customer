import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/address/presentation/providers/address_notifier.dart';
import 'package:groozil_app/features/category/presentation/widgets/category_grid.dart';
import 'package:groozil_app/features/home/presentation/providers/home_notifier.dart';
import 'package:groozil_app/features/home/presentation/providers/home_state.dart';
import 'package:groozil_app/features/home/presentation/widgets/banner_carousel.dart';
import 'package:groozil_app/features/home/presentation/widgets/delivery_location_header.dart';
import 'package:groozil_app/features/home/presentation/widgets/favorites_section.dart';
import 'package:groozil_app/features/home/presentation/widgets/featured_products_section.dart';
import 'package:groozil_app/features/home/presentation/widgets/smart_plans_section.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/inputs/search_field.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(ref.read(homeProvider.notifier).loadHomeData());
      // Load addresses when home screen initializes
      unawaited(ref.read(addressProvider.notifier).loadAddresses());
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(homeProvider.notifier).refresh(),
          color: AppColors.primary,
          child: homeState.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: _buildShimmerLoading,
            loaded: (categories, banners) => CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppSizes.paddingL.padH + AppSizes.paddingL.padT
                        + AppSizes.paddingS.padB,
                    child: const DeliveryLocationHeader(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppSizes.paddingL.padH + AppSizes.paddingS.padV,
                    child: const SearchField(
                      hint: 'Search fresh groceries',
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppSizes.paddingS.padT,
                    child: BannerCarousel(banners: banners),
                  ),
                ),
                if (categories.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: AppSizes.paddingL.padH + AppSizes.paddingM.padT,
                      child: CategoryGrid(categories: categories),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: 16.padT,
                    child: const FeaturedProductsSection(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: 16.padT,
                    child: const FavoritesSection(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: 16.padT,
                    child: const SmartPlansSection(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: 80.hBox,
                ),
              ],
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 60.sp,
                    color: AppColors.error,
                  ),
                  SizedBox(height: AppSizes.spaceL),
                  Text(
                    message,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSizes.spaceL),
                  ElevatedButton(
                    onPressed: () async {
                      await ref.read(homeProvider.notifier).loadHomeData();
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
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.paddingL),
            child: Column(
              children: [
                ShimmerLoading(
                  height: 60.h,
                  width: double.infinity,
                  borderRadius: AppSizes.radiusL,
                ),
                SizedBox(height: AppSizes.spaceL),
                ShimmerLoading(
                  height: 50.h,
                  width: double.infinity,
                  borderRadius: AppSizes.radiusL,
                ),
                SizedBox(height: AppSizes.spaceL),
                ShimmerLoading(
                  height: 180.h,
                  width: double.infinity,
                  borderRadius: AppSizes.radiusXL,
                ),
                SizedBox(height: AppSizes.spaceL),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: AppSizes.paddingM,
                    mainAxisSpacing: AppSizes.paddingM,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ShimmerLoading(
                      height: 100.h,
                      width: 80.w,
                      borderRadius: AppSizes.radiusL,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
