// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductDetails)
const productDetailsProvider = ProductDetailsFamily._();

final class ProductDetailsProvider
    extends $NotifierProvider<ProductDetails, ProductDetailsState> {
  const ProductDetailsProvider._({
    required ProductDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailsHash();

  @override
  String toString() {
    return r'productDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductDetails create() => ProductDetails();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductDetailsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductDetailsState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailsHash() => r'a2710f16ac7e0214c650b264b62bd796509814ab';

final class ProductDetailsFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductDetails,
          ProductDetailsState,
          ProductDetailsState,
          ProductDetailsState,
          String
        > {
  const ProductDetailsFamily._()
    : super(
        retry: null,
        name: r'productDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductDetailsProvider call(String productId) =>
      ProductDetailsProvider._(argument: productId, from: this);

  @override
  String toString() => r'productDetailsProvider';
}

abstract class _$ProductDetails extends $Notifier<ProductDetailsState> {
  late final _$args = ref.$arg as String;
  String get productId => _$args;

  ProductDetailsState build(String productId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ProductDetailsState, ProductDetailsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductDetailsState, ProductDetailsState>,
              ProductDetailsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
