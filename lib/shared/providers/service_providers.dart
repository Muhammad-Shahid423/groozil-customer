import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/core/services/storage/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_providers.g.dart';

@riverpod
StorageService storageService(Ref ref) {
  return getIt<StorageService>();
}
