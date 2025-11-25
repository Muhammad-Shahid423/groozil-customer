import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/home/domain/entities/banner_entity.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class BannerCarousel extends StatefulWidget {

  const BannerCarousel({
    required this.banners, super.key,
  });
  final List<BannerEntity> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return _buildPlaceholderBanner();
    }

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.banners.length,
          itemBuilder: (context, index, realIndex) {
            final banner = widget.banners[index];
            return _buildBannerCard(banner);
          },
          options: CarouselOptions(
            height: 140.h,
            viewportFraction: 0.9,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        AppSizes.spaceM.hBox,
        _buildIndicators(),
      ],
    );
  }

  Widget _buildBannerCard(BannerEntity banner) {
    return Container(
      width: double.infinity,
      margin: AppSizes.paddingXS.padH,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xffFDE28B),
              Color(0xffFEEBB1),
              Color(0xffFDE28B)
            ]
        ),
        borderRadius: AppSizes.radiusL.rBox,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        child: Stack(
          children: [
            Padding(
              padding: AppSizes.paddingXL.padH + AppSizes.paddingM.padV,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    banner.getTitle('en'),
                    style: AppTextStyles.light.semiBold14_17?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  4.hBox,
                  Text(
                    banner.getDescription('en') ?? '',
                    style: AppTextStyles.light.bold20_25?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                  ),
                  AppSizes.spaceM.hBox,
                  Container(
                    padding: AppSizes.paddingXL.padH + 5.padV,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        AppColors.primary,
                        AppColors.secondary
                      ]),
                      borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                    ),
                    child: Text(
                      'Order Now',
                      style: AppTextStyles.light.semiBold12_15?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Banner Image (Right side)
            if (banner.displayImage.isNotEmpty)
              Positioned(
                right: -20.w,
                top: 0,
                bottom: 0,
                child: CachedNetworkImage(
                  imageUrl: banner.displayImage,
                  width: 180.w,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) => const SizedBox.shrink(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderBanner() {
    return Container(
      height: 140.h,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffFDE28B),
            Color(0xffFEEBB1),
            Color(0xffFDE28B)
          ]
        ),
        borderRadius: AppSizes.radiusL.rBox,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: AppSizes.paddingXL.padH + AppSizes.paddingM.padV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fresh Fruits',
              style: AppTextStyles.light.semiBold14_17?.copyWith(
                color: AppColors.primary,
              ),
            ),
            4.hBox,
            Text(
              'Get 20% Off on\nFresh Fruits!',
              style: AppTextStyles.light.bold20_25?.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            AppSizes.spaceM.hBox,
            Container(
              padding: AppSizes.paddingXL.padH + 5.padV,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  AppColors.primary,
                  AppColors.secondary
                ]),
                borderRadius: BorderRadius.circular(AppSizes.radiusXL),
              ),
              child: Text(
                'Order Now',
                style: AppTextStyles.light.semiBold12_15?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.banners.isEmpty ? 3 : widget.banners.length,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: _currentIndex == index ? 24.w : 8.w,
          decoration: BoxDecoration(
            color: _currentIndex == index
                ? AppColors.primary
                : AppColors.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
          ),
        ),
      ),
    );
  }
}
