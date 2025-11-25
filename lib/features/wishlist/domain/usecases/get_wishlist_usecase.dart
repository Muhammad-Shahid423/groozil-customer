import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:groozil_app/features/wishlist/domain/repostories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishlistUseCase implements UseCase<WishlistEntity, NoParams> {
  GetWishlistUseCase(this._repository);
  
  final WishlistRepository _repository;

  @override
  Future<Either<Failure, WishlistEntity>> call(NoParams params) {
    return _repository.getWishlist();
  }
}
