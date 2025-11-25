import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:groozil_app/features/wishlist/domain/repostories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

class AddToWishlistParams extends Equatable {
  const AddToWishlistParams({
    required this.productId,
    this.notes,
    this.priority,
    this.notifyOnDiscount,
    this.notifyOnStock,
  });

  final String productId;
  final String? notes;
  final int? priority;
  final bool? notifyOnDiscount;
  final bool? notifyOnStock;

  @override
  List<Object?> get props => [
        productId,
        notes,
        priority,
        notifyOnDiscount,
        notifyOnStock,
      ];
}

@injectable
class AddToWishlistUseCase implements UseCase<WishlistItem, AddToWishlistParams> {
  AddToWishlistUseCase(this._repository);
  
  final WishlistRepository _repository;

  @override
  Future<Either<Failure, WishlistItem>> call(AddToWishlistParams params) {
    return _repository.addToWishlist(
      productId: params.productId,
      notes: params.notes,
      priority: params.priority,
      notifyOnDiscount: params.notifyOnDiscount,
      notifyOnStock: params.notifyOnStock,
    );
  }
}
