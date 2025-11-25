import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:groozil_app/features/category/domain/usecases/get_categories_usecase.dart';
import 'package:groozil_app/features/home/presentation/providers/home_state.dart';
import 'package:groozil_app/features/home/presentation/providers/home_usecase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  late final GetCategoriesUseCase _getCategoriesUseCase;
  late final GetBannersUseCase _getBannersUseCase;

  @override
  HomeState build() {
    _getCategoriesUseCase = ref.read(getCategoriesUseCaseProvider);
    _getBannersUseCase = ref.read(getBannersUseCaseProvider);

    return const HomeState.initial();
  }

  /// Loads categories and banners and updates the state.
  Future<void> loadHomeData() async {
    state = const HomeState.loading();

    // Execute UseCases
    final categoriesResult = await _getCategoriesUseCase(NoParams());
    final bannersResult = await _getBannersUseCase(NoParams());

    // Handle results (using the existing sequential fold logic)
    categoriesResult.fold(
          (failure) => state = HomeState.error(failure.message),
          (categories) {
        bannersResult.fold(
              (failure) => state = HomeState.error(failure.message),
              (banners) {
            state = HomeState.loaded(
              categories: categories,
              banners: banners,
            );
          },
        );
      },
    );
  }

  /// Refreshes the home data by reloading it.
  Future<void> refresh() async {
    await loadHomeData();
  }
}
