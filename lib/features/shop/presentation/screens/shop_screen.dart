import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/category/presentation/widgets/category_tabs.dart';
import 'package:groozil_app/features/home/presentation/providers/home_notifier.dart';
import 'package:groozil_app/features/home/presentation/providers/home_state.dart';
import 'package:groozil_app/features/shop/presentation/providers/filter_notifier.dart';
import 'package:groozil_app/features/shop/presentation/providers/product_notifier.dart';
import 'package:groozil_app/features/shop/presentation/providers/product_state.dart';
import 'package:groozil_app/features/shop/presentation/widgets/filter_bottom_sheet.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/inputs/search_field.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';
import 'package:groozil_app/shared/widgets/product/product_grid.dart';

class ShopScreen extends ConsumerStatefulWidget {

  const ShopScreen({super.key, this.categoryId});
  final String? categoryId;

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen> {
  final ScrollController _scrollController = ScrollController();
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _selectedCategoryId = widget.categoryId;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_selectedCategoryId != null) {
        await ref.read(productProvider.notifier).loadProductsByCategory(_selectedCategoryId!);
      } else {
        await ref.read(productProvider.notifier).loadProducts();
      }
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      await ref.read(productProvider.notifier).loadMoreProducts();
    }
  }

  void _showFilterBottomSheet() {
    final currentFilter = ref.read(filterProvider);
    unawaited(showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(
        currentFilter: currentFilter,
        onApplyFilters: (filter) async {
          ref.read(filterProvider.notifier).applyFilter(filter);
          await ref.read(productProvider.notifier).applyFilter(filter);
        },
        onClearFilters: () async {
          ref.read(filterProvider.notifier).clearAllFilters();
          await ref.read(productProvider.notifier).clearFilter();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productProvider);
    final homeState = ref.watch(homeProvider);
    final activeFilterCount = ref.watch(activeFilterCountProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppSizes.paddingL.padH,
              child: Row(
                children: [
                  Expanded(
                    child: SearchField(
                      onTap: () {},
                      onChanged: (query) async {
                        await ref.read(productProvider.notifier).searchProducts(query);
                      },
                    ),
                  ),
                  AppSizes.paddingM.wBox,
                  GestureDetector(
                    onTap: _showFilterBottomSheet,
                    child: Stack(
                      children: [
                        Container(
                          width: 42.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: AppSizes.radiusCircle.rBox,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.tune,
                            color: AppColors.textPrimary,
                            size: 24.sp,
                          ),
                        ),
                        if (activeFilterCount > 0)
                          Positioned(
                            top: 8.h,
                            right: 8.w,
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 18.w,
                                minHeight: 18.h,
                              ),
                              child: Center(
                                child: Text(
                                  activeFilterCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppSizes.paddingM.hBox,
            homeState.maybeWhen(
              loaded: (categories, banners) => CategoryTabs(
                categories: categories,
                selectedCategoryId: _selectedCategoryId,
                onCategorySelected: (categoryId) async {
                  setState(() {
                    _selectedCategoryId = categoryId;
                  });

                  if (categoryId == null) {
                    await ref.read(productProvider.notifier).loadProducts();
                  } else {
                    await ref.read(productProvider.notifier).loadProductsByCategory(categoryId);
                  }
                },
              ),
              orElse: () => const SizedBox.shrink(),
            ),
            Expanded(
              child: productState.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: _buildShimmerGrid,
                loaded: (products) {
                  if (products.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 80.sp,
                            color: AppColors.textHint,
                          ),
                          SizedBox(height: AppSizes.spaceL),
                          Text(
                            'No products found',
                            style: AppTextStyles.light.medium16_20?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () => ref.read(productProvider.notifier).refresh(),
                    color: AppColors.primary,
                    child: ProductGrid(
                      products: products,
                      scrollController: _scrollController,
                    ),
                  );
                },
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
                          await ref.read(productProvider.notifier).refresh();
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
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(AppSizes.paddingL),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        crossAxisSpacing: AppSizes.paddingM,
        mainAxisSpacing: AppSizes.paddingM,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ShimmerLoading(
          height: 220.h,
          width: double.infinity,
          borderRadius: AppSizes.radiusL,
        );
      },
    );
  }
}
