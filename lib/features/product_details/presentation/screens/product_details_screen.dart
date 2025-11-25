import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/cart/presentation/providers/cart_counter_notifier.dart';
import 'package:groozil_app/features/product_details/presentation/providers/product_details_notifier.dart';
import 'package:groozil_app/features/product_details/presentation/providers/product_details_state.dart';
import 'package:groozil_app/features/product_details/presentation/widgets/product_image_carousel.dart';
import 'package:groozil_app/features/product_details/presentation/widgets/quantity_selector.dart';
import 'package:groozil_app/features/product_details/presentation/widgets/stock_badge.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/buttons/app_button.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';
import 'package:groozil_app/shared/widgets/product/rating_badge.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {

  const ProductDetailsScreen({
    required this.productId,
    super.key,
    this.cachedProduct,
  });
  final String productId;
  final Object? cachedProduct;

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(productDetailsProvider(widget.productId).notifier)
          .loadProduct(widget.productId, cachedProduct: widget.cachedProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    final productDetailsState = ref.watch(productDetailsProvider(widget.productId));

    return Scaffold(
      backgroundColor: AppColors.backgroundCream,
      body: productDetailsState.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: _buildShimmerLoading,
        loaded: (product) => Stack(
          children: [
            CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ProductImageCarousel(
                        productId: widget.productId,
                        images: product.images ?? [AssetsConstants.placeholder],
                        fallbackImage: product.primaryImage,
                      ),
                      Transform.translate(
                        offset: Offset(0, -28.h),
                        child: Container(
                          padding: 20.padH + 25.padV,
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  RatingBadge(
                                    rating: product.rating,
                                    reviewCount: product.reviewCount,
                                  ),
                                  const Spacer(),
                                  StockBadge(inStock: product.inStock),
                                ],
                              ),
                              SizedBox(height: AppSizes.spaceL),
                              Text(
                                product.getName('en'),
                                style: AppTextStyles.light.semiBold24_30?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: AppSizes.spaceM),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'SAR ${product.price.toStringAsFixed(1)}',
                                    style: AppTextStyles.light.bold32_40?.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(width: AppSizes.paddingS),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: Text(
                                      '/ ${product.unit}',
                                      style: AppTextStyles.light.regular16_20?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (product.hasDiscount) ...[
                                SizedBox(height: AppSizes.spaceS),
                                Text(
                                  'SAR ${product.comparePrice!.toStringAsFixed(1)}',
                                  style: AppTextStyles.light.regular16_20?.copyWith(
                                    color: AppColors.textHint,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                              SizedBox(height: AppSizes.spaceXXL),
                              Text(
                                'Description',
                                style: AppTextStyles.light.semiBold20_25?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: AppSizes.spaceM),
                              Text(
                                product.getDescription('en') ?? 'No description available',
                                style: AppTextStyles.light.regular16_20?.copyWith(
                                  color: AppColors.textSecondary,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: AppSizes.spaceXXL),
                              Text(
                                'More About this item',
                                style: AppTextStyles.light.semiBold20_25?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: AppSizes.spaceL),
                              if (product.category != null) ...[
                                _buildInfoRow(
                                  'Category',
                                  product.category!.getName('en'),
                                ),
                                _buildDottedDivider(),
                              ],
                              if (product.brand != null) ...[
                                _buildInfoRow('Brand', product.brand!),
                                _buildDottedDivider(),
                              ],
                              _buildInfoRow('SKU', product.sku),
                              SizedBox(height: 120.h), // Space for bottom bar
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: AppSizes.paddingXL.padAll,
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: AppSizes.radiusBottomSheet.rBox,
                  boxShadow: [
                    BoxShadow(
                      color: context.theme.shadowColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      QuantitySelector(
                        quantity: _quantity,
                        onDecrement: () {
                          if (_quantity > 1) {
                            setState(() => _quantity--);
                          }
                        },
                        onIncrement: () {
                          if (_quantity < product.stock) {
                            setState(() => _quantity++);
                          }
                        },
                      ),
                      SizedBox(width: AppSizes.paddingL),
                      Expanded(
                        child: AppButton.primary(
                          label: 'Add to Cart',
                          preFix: AssetsConstants.cartEmpty,
                          textStyle: AppTextStyles.light.regular16_20?.copyWith(color: Colors.white),
                          onPressed: product.inStock
                              ? () {
                            ref
                                .read(cartCounterProvider.notifier)
                                .increment();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${product.getName('en')} added to cart',
                                ),
                                backgroundColor: AppColors.success,
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                              : null,
                          // icon: Icons.shopping_cart,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                  // await ref
                  //     .read(productDetailsProvider(widget.productId).notifier)
                  //     .refresh(widget.productId);
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
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.paddingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.light.medium16_20?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.light.semiBold16_20?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDottedDivider() {
    return CustomPaint(
      size: Size(double.infinity, 1.h),
      painter: DottedLinePainter(),
    );
  }

  Widget _buildShimmerLoading() {
    return Column(
      children: [
        ShimmerLoading(
          height: 400.h,
          width: double.infinity,
          borderRadius: 0,
        ),
        Padding(
          padding: EdgeInsets.all(AppSizes.paddingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                height: 30.h,
                width: 200.w,
                borderRadius: AppSizes.radiusM,
              ),
              SizedBox(height: AppSizes.spaceL),
              ShimmerLoading(
                height: 40.h,
                width: 150.w,
                borderRadius: AppSizes.radiusM,
              ),
              SizedBox(height: AppSizes.spaceXL),
              ShimmerLoading(
                height: 100.h,
                width: double.infinity,
                borderRadius: AppSizes.radiusM,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Dotted Line Painter
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 1.5;

    const dashWidth = 5;
    const dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
