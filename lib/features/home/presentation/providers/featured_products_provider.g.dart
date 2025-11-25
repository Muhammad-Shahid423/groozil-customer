// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(featuredProducts)
const featuredProductsProvider = FeaturedProductsProvider._();

final class FeaturedProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  const FeaturedProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featuredProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featuredProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return featuredProducts(ref);
  }
}

String _$featuredProductsHash() => r'5bc1a8af9c72b4397c24a65575920a1518d59cbb';
