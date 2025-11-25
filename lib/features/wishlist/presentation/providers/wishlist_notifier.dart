import 'package:groozil_app/core/usecases/usecase.dart';
import 'package:groozil_app/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:groozil_app/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:groozil_app/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:groozil_app/features/wishlist/presentation/providers/wishlist_state.dart';
import 'package:groozil_app/features/wishlist/presentation/providers/wishlist_usecase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishlist_notifier.g.dart';

@riverpod
class Wishlist extends _$Wishlist {
  @override
  WishlistState build() {
    _getWishlistUseCase = ref.read(getWishlistUseCaseProvider);
    _addToWishlistUseCase = ref.read(addToWishlistUseCaseProvider);
    _removeFromWishlistUseCase = ref.read(removeFromWishlistUseCaseProvider);
    
    // Auto-load wishlist on build
    loadWishlist();
    
    return const WishlistState.initial();
  }

  late final GetWishlistUseCase _getWishlistUseCase;
  late final AddToWishlistUseCase _addToWishlistUseCase;
  late final RemoveFromWishlistUseCase _removeFromWishlistUseCase;

  Future<void> loadWishlist() async {
    state = const WishlistState.loading();
    
    final result = await _getWishlistUseCase(NoParams());
    
    result.fold(
      (failure) => state = WishlistState.error(failure.message),
      (wishlist) => state = WishlistState.loaded(wishlist),
    );
  }

  Future<void> toggleWishlist(String productId) async {
    final currentState = state;
    
    currentState.maybeWhen(
      loaded: (wishlist) {
        // Check if product is already in wishlist
        final existingItemIndex = wishlist.items.indexWhere(
          (item) => item.product?.id == productId,
        );

        if (existingItemIndex != -1) {
          final existingItem = wishlist.items[existingItemIndex];
          removeFromWishlist(existingItem.id);
        } else {
          addToWishlist(productId);
        }
      },
      orElse: () {
        // If not loaded, just add the product
        addToWishlist(productId);
      },
    );
  }

  Future<void> addToWishlist(
    String productId, {
    String? notes,
    int? priority,
    bool? notifyOnDiscount,
    bool? notifyOnStock,
  }) async {
    final params = AddToWishlistParams(
      productId: productId,
      notes: notes,
      priority: priority,
      notifyOnDiscount: notifyOnDiscount,
      notifyOnStock: notifyOnStock,
    );

    final result = await _addToWishlistUseCase(params);
    
    result.fold(
      (failure) {
        // Handle error - could emit error state or show snackbar
        state = WishlistState.error(failure.message);
      },
      (newItem) {
        // Refresh the wishlist to get updated data
        loadWishlist();
      },
    );
  }

  Future<void> removeFromWishlist(String wishlistItemId) async {
    final result = await _removeFromWishlistUseCase(wishlistItemId);
    
    result.fold(
      (failure) {
        state = WishlistState.error(failure.message);
      },
      (_) {
        // Refresh the wishlist
        loadWishlist();
      },
    );
  }

  Future<void> refresh() async {
    await loadWishlist();
  }
}

// Provider to check if a product is in the wishlist
@riverpod
bool isInWishlist(Ref ref, String productId) {
  final wishlistState = ref.watch(wishlistProvider);
  
  return wishlistState.maybeWhen(
    loaded: (wishlist) {
      return wishlist.items.any((item) => item.product?.id == productId);
    },
    orElse: () => false,
  );
}

// Provider to get wishlist item count
@riverpod
int wishlistItemCount(Ref ref) {
  final wishlistState = ref.watch(wishlistProvider);
  
  return wishlistState.maybeWhen(
    loaded: (wishlist) => wishlist.items.length,
    orElse: () => 0,
  );
}
