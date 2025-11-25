// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddressNotifier)
const addressProvider = AddressNotifierProvider._();

final class AddressNotifierProvider
    extends $NotifierProvider<AddressNotifier, AddressState> {
  const AddressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addressNotifierHash();

  @$internal
  @override
  AddressNotifier create() => AddressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddressState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddressState>(value),
    );
  }
}

String _$addressNotifierHash() => r'96be1c905a36febf25b5a3fabc06b35d4116c787';

abstract class _$AddressNotifier extends $Notifier<AddressState> {
  AddressState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddressState, AddressState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddressState, AddressState>,
              AddressState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
