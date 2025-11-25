import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:groozil_app/features/category/domain/usecases/get_categories_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_usecase_providers.g.dart';

@riverpod
GetCategoriesUseCase getCategoriesUseCase(Ref ref) {
  return getIt<GetCategoriesUseCase>();
}

@riverpod
GetBannersUseCase getBannersUseCase(Ref ref) {
  return getIt<GetBannersUseCase>();
}
