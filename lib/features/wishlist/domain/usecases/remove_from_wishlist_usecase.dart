import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/wishlist/domain/repostories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromWishlistUseCase implements UseCase<void, String> {
  RemoveFromWishlistUseCase(this._repository);
  
  final WishlistRepository _repository;

  @override
  Future<Either<Failure, void>> call(String wishlistItemId) {
    return _repository.removeFromWishlist(wishlistItemId);
  }
}
