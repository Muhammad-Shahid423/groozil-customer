import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/features/wishlist/presentation/providers/wishlist_notifier.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';
import 'package:groozil_app/shared/widgets/app_slider_dots.dart';
import 'package:groozil_app/shared/widgets/containers/app_container.dart';

class ProductImageCarousel extends ConsumerStatefulWidget {
  const ProductImageCarousel({
    required this.productId,
    required this.images,
    super.key,
    this.fallbackImage,
  });
  final List<String> images;
  final String? fallbackImage;
  final String productId;

  @override
  ConsumerState<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends ConsumerState<ProductImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isInWishlist = ref.watch(isInWishlistProvider(widget.productId));
    final validImages = widget.images.where((img) => img.isNotEmpty).toList();
    
    final displayImages = validImages.isNotEmpty
        ? validImages
        : widget.fallbackImage != null && widget.fallbackImage!.isNotEmpty
        ? [widget.fallbackImage!]
        : <String>[];

    if (displayImages.isEmpty) {
      return _buildPlaceholder();
    }

    return SizedBox(
      height: 330.h,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: displayImages.length,
            itemBuilder: (context, index, realIndex) {
              if (index == 0) {
                return Hero(
                  tag: 'product-image-${widget.productId}',
                  child: AppImage(
                    height: double.infinity,
                    width: double.infinity,
                    path: displayImages[index],
                  ),
                );
              }
              return AppImage(
                height: double.infinity,
                width: double.infinity,
                path: displayImages[index],
              );
            },
            options: CarouselOptions(
              height: 330.h,
              viewportFraction: 1,
              enableInfiniteScroll: displayImages.length > 1,
              autoPlay: displayImages.length > 1,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.easeInOut,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircleButton(
                  icon: Icons.arrow_back,
                  context: context,
                  onTap: () => Navigator.pop(context),
                ),
                Row(
                  children: [
                    _buildCircleButton(
                      icon: isInWishlist
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isInWishlist ? AppColors.error : null,
                      context: context,
                      onTap: () {
                        ref.read(wishlistProvider.notifier)
                            .toggleWishlist(widget.productId);
                      },
                    ),
                    SizedBox(width: AppSizes.paddingM),
                    _buildCircleButton(
                      icon: Icons.shopping_cart_outlined,
                      context: context,
                      onTap: () {
                        // Navigate to cart
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (displayImages.length > 1)
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSliderDots(
                    currentPage: _currentIndex,
                    itemsLength: displayImages.length,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Hero(
      tag: 'product-image-${widget.productId}',
      child: AppImage(
        height: 300.h,
        width: double.infinity,
        path: AssetsConstants.placeholder,
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
    required BuildContext context,
    Color? color,
  }) {
    return AppContainer(
      onTap: onTap,
      width: 45.w,
      height: 45.h,
      boxShadow: [
        BoxShadow(
          color: context.theme.shadowColor.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
      child: Icon(
        icon,
        color: color ?? AppColors.textPrimary,
        size: 24.sp,
      ),
    );
  }
}
