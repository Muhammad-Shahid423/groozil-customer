import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/shop/domain/entities/product_filter.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/buttons/app_button.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {

  const FilterBottomSheet({
    required this.onApplyFilters,
    required this.onClearFilters,
    super.key,
    this.currentFilter,
  });
  final void Function(ProductFilter) onApplyFilters;
  final VoidCallback onClearFilters;
  final ProductFilter? currentFilter;

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  late bool? _inStock;
  late RangeValues _priceRange;
  late String? _selectedPackSize;
  late int? _selectedRating;

  final List<String> _packSizes = ['500g', '1kg', '2L', 'Dozen'];

  @override
  void initState() {
    super.initState();
    // Initialize with current filter values
    final filter = widget.currentFilter;
    _inStock = filter?.inStock;
    _priceRange = RangeValues(
      filter?.minPrice ?? 10,
      filter?.maxPrice ?? 250,
    );
    _selectedPackSize = filter?.packSize;
    _selectedRating = filter?.minRating;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.radiusXXL),
          topRight: Radius.circular(AppSizes.radiusXXL),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.paddingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle Bar
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.divider,
                    borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
                  ),
                ),
              ),

              SizedBox(height: AppSizes.spaceL),

              // Title
              Text(
                'Filter Items',
                style: AppTextStyles.light.semiBold24_30?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: AppSizes.spaceS),

              Text(
                'Narrow down your search by preferences and price.',
                style: AppTextStyles.light.regular14_17?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              SizedBox(height: AppSizes.spaceXXL),

              // Availability
              Text(
                'Availability',
                style: AppTextStyles.light.semiBold16_20?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: AppSizes.spaceM),

              Row(
                children: [
                  Expanded(
                    child: _buildChip(
                      label: 'In Stock',
                      isSelected: _inStock ?? false,
                      onTap: () {
                        setState(() {
                          _inStock = _inStock ?? false ? null : true;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: AppSizes.paddingM),
                  Expanded(
                    child: _buildChip(
                      label: 'Out of Stock',
                      isSelected: _inStock == false,
                      onTap: () {
                        setState(() {
                          _inStock = _inStock == false ? null : false;
                        });
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSizes.spaceXXL),

              // Price Range
              Text(
                'Price Range',
                style: AppTextStyles.light.semiBold16_20?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: AppSizes.spaceM),

              RangeSlider(
                values: _priceRange,
                max: 500,
                divisions: 50,
                activeColor: AppColors.primary,
                inactiveColor: AppColors.primary.withOpacity(0.2),
                labels: RangeLabels(
                  'SAR ${_priceRange.start.round()}',
                  'SAR ${_priceRange.end.round()}',
                ),
                onChanged: (values) {
                  setState(() {
                    _priceRange = values;
                  });
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SAR ${_priceRange.start.round()}',
                    style: AppTextStyles.light.medium14_17?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    'SAR ${_priceRange.end.round()}',
                    style: AppTextStyles.light.medium14_17?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSizes.spaceXXL),

              // Pack Size
              Text(
                'Pack Size',
                style: AppTextStyles.light.semiBold16_20?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: AppSizes.spaceM),

              Wrap(
                spacing: AppSizes.paddingM,
                runSpacing: AppSizes.paddingM,
                children: _packSizes.map((size) {
                  return _buildChip(
                    label: size,
                    isSelected: _selectedPackSize == size,
                    onTap: () {
                      setState(() {
                        _selectedPackSize =
                        _selectedPackSize == size ? null : size;
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: AppSizes.spaceXXL),

              // Rating
              Text(
                'Rating',
                style: AppTextStyles.light.semiBold16_20?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: AppSizes.spaceM),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  final rating = index + 1;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedRating =
                        _selectedRating == rating ? null : rating;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: _selectedRating == rating
                            ? AppColors.primary.withOpacity(0.1)
                            : Colors.transparent,
                        border: Border.all(
                          color: _selectedRating == rating
                              ? AppColors.primary
                              : AppColors.border,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                      child: Row(
                        children: [
                          Text(
                            rating.toString(),
                            style: AppTextStyles.light.medium14_17?.copyWith(
                              color: _selectedRating == rating
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.star,
                            size: 16.sp,
                            color: const Color(0xFFFFB800),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: AppSizes.spaceXXXL),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _inStock = null;
                          _priceRange = const RangeValues(10, 250);
                          _selectedPackSize = null;
                          _selectedRating = null;
                        });
                        widget.onClearFilters();
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        side: const BorderSide(
                          color: AppColors.border,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusL),
                        ),
                      ),
                      child: Text(
                        'Clear All',
                        style: AppTextStyles.light.semiBold16_20?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSizes.paddingL),
                  Expanded(
                    child: AppButton.primary(
                      label: 'Apply Filters',
                      onPressed: () {
                        final filter = ProductFilter(
                          inStock: _inStock,
                          minPrice: _priceRange.start,
                          maxPrice: _priceRange.end,
                          packSize: _selectedPackSize,
                          minRating: _selectedRating,
                        );
                        widget.onApplyFilters(filter);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              60.hBox
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL,
          vertical: AppSizes.paddingM,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
        ),
        child: Text(
          label,
          style: AppTextStyles.light.medium14_17?.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
