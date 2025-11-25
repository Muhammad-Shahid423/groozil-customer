import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:groozil_app/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:groozil_app/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishlist_usecase_providers.g.dart';

@riverpod
GetWishlistUseCase getWishlistUseCase(Ref ref) {
  return getIt<GetWishlistUseCase>();
}

@riverpod
AddToWishlistUseCase addToWishlistUseCase(Ref ref) {
  return getIt<AddToWishlistUseCase>();
}

@riverpod
RemoveFromWishlistUseCase removeFromWishlistUseCase(Ref ref) {
  return getIt<RemoveFromWishlistUseCase>();
}
