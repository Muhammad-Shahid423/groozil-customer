// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Wishlist)
const wishlistProvider = WishlistProvider._();

final class WishlistProvider
    extends $NotifierProvider<Wishlist, WishlistState> {
  const WishlistProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wishlistProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wishlistHash();

  @$internal
  @override
  Wishlist create() => Wishlist();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WishlistState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WishlistState>(value),
    );
  }
}

String _$wishlistHash() => r'bb071c93a72af87b0383594c22dfc4ccb2d7453b';

abstract class _$Wishlist extends $Notifier<WishlistState> {
  WishlistState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<WishlistState, WishlistState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WishlistState, WishlistState>,
              WishlistState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(isInWishlist)
const isInWishlistProvider = IsInWishlistFamily._();

final class IsInWishlistProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsInWishlistProvider._({
    required IsInWishlistFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isInWishlistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isInWishlistHash();

  @override
  String toString() {
    return r'isInWishlistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return isInWishlist(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsInWishlistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isInWishlistHash() => r'a313e790ec8a62c69847c4241251bcea496bf4ff';

final class IsInWishlistFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  const IsInWishlistFamily._()
    : super(
        retry: null,
        name: r'isInWishlistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsInWishlistProvider call(String productId) =>
      IsInWishlistProvider._(argument: productId, from: this);

  @override
  String toString() => r'isInWishlistProvider';
}

@ProviderFor(wishlistItemCount)
const wishlistItemCountProvider = WishlistItemCountProvider._();

final class WishlistItemCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const WishlistItemCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wishlistItemCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wishlistItemCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return wishlistItemCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$wishlistItemCountHash() => r'd0bdc916ff1f1bcc026132818ad5832854e3fe52';
