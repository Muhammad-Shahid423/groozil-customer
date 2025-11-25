import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groozil_app/features/home/domain/entities/banner_entity.dart';
import 'package:groozil_app/features/category/domain/entities/category_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required List<CategoryEntity> categories,
    required List<BannerEntity> banners,
  }) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}
