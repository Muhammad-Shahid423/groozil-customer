// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_usecase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCategoriesUseCase)
const getCategoriesUseCaseProvider = GetCategoriesUseCaseProvider._();

final class GetCategoriesUseCaseProvider
    extends
        $FunctionalProvider<
          GetCategoriesUseCase,
          GetCategoriesUseCase,
          GetCategoriesUseCase
        >
    with $Provider<GetCategoriesUseCase> {
  const GetCategoriesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCategoriesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCategoriesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCategoriesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCategoriesUseCase create(Ref ref) {
    return getCategoriesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCategoriesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCategoriesUseCase>(value),
    );
  }
}

String _$getCategoriesUseCaseHash() =>
    r'1f1411f537267015050d9e0baa9445809996e586';

@ProviderFor(getBannersUseCase)
const getBannersUseCaseProvider = GetBannersUseCaseProvider._();

final class GetBannersUseCaseProvider
    extends
        $FunctionalProvider<
          GetBannersUseCase,
          GetBannersUseCase,
          GetBannersUseCase
        >
    with $Provider<GetBannersUseCase> {
  const GetBannersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBannersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBannersUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBannersUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetBannersUseCase create(Ref ref) {
    return getBannersUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBannersUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBannersUseCase>(value),
    );
  }
}

String _$getBannersUseCaseHash() => r'74c7e9c240cb2c5319e7801b152c0b1ea8238b8b';
