import 'package:flutter/material.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/features/shop/domain/entities/product.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/product/product_card.dart';

class ProductGrid extends StatelessWidget {

  const ProductGrid({
    required this.products,
    super.key,
    this.scrollController,
  });
  final List<Product> products;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: AppSizes.paddingL.padH + AppSizes.paddingM.padT + 80.padB,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.79,
        crossAxisSpacing: AppSizes.paddingM,
        mainAxisSpacing: AppSizes.paddingM,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          enableHero: false, // Disable hero in grid to avoid conflicts
        );
      },
    );
  }
}
