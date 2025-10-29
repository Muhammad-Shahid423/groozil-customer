import 'package:groozil_app/core/services/storage/storage_service.dart';
import 'package:groozil_app/shared/providers/service_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@Riverpod(keepAlive: true)
class OnboardingNotifier extends _$OnboardingNotifier {
  late final StorageService _storage;

  @override
  int build() {
    _storage = ref.read(storageServiceProvider);
    return 0;
  }

  void setPage(int page) {
    state = page;
  }

  void nextPage() {
    if (state < 2) {
      state = state + 1;
    }
  }

  void previousPage() {
    if (state > 0) {
      state = state - 1;
    }
  }

  Future<void> completeOnboarding() async {
    await _storage.setOnboardingCompleted(completed: true);
  }

  Future<bool> isOnboardingCompleted() async {
    return _storage.getOnboardingCompleted();
  }
}
