// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_counter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartCounter)
const cartCounterProvider = CartCounterProvider._();

final class CartCounterProvider extends $NotifierProvider<CartCounter, int> {
  const CartCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartCounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartCounterHash();

  @$internal
  @override
  CartCounter create() => CartCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cartCounterHash() => r'500019dec9175a062dcb6433fe26f6f2183c4225';

abstract class _$CartCounter extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
