# Wishlist Module Implementation Summary

## ✅ Completed Files

### Domain Layer
1. ✅ `wishlist_item.dart` - WishlistItem entity (needs build_runner)
2. ✅ `wishlist_entity.dart` - WishlistEntity (needs build_runner)
3. ✅ `wishlist_repository.dart` - Repository interface
4. ✅ `get_wishlist_usecase.dart` - Get wishlist usecase
5. ✅ `add_to_wishlist_usecase.dart` - Add to wishlist usecase
6. ✅ `remove_from_wishlist_usecase.dart` - Remove from wishlist usecase

### Data Layer
1. ✅ `wishlist_item_model.dart` - WishlistItemModel (needs build_runner)
2. ✅ `wishlist_model.dart` - WishlistModel (needs build_runner)
3. ✅ `wishlist_item_mapper.dart` - Mapper for WishlistItem
4. ✅ `wishlist_mapper.dart` - Mapper for Wishlist
5. ✅ `product_mapper.dart` - Product mapper (newly created)
6. ⚠️ `wishlist_remote_datasource.dart` - Needs Retrofit annotations

### Presentation Layer
1. ✅ `wishlist_screen.dart` - UI screen (already working with local state)

## 🔧 Next Steps

### 1. Add Retrofit Endpoints to ApiClient

Add to `/lib/core/network/client/api_client.dart`:

```dart
// ==================== WISHLIST ENDPOINTS ====================
@GET('/wishlist')
Future<ApiResponse<WishlistModel>> getWishlist();

@POST('/wishlist/items')
Future<ApiResponse<WishlistItemModel>> addToWishlist(@Body() Map<String, dynamic> body);

@DELETE('/wishlist/items/{itemId}')
Future<ApiResponse<dynamic>> removeFromWishlist(@Path('itemId') String itemId);
```

### 2. Create Wishlist Repository Implementation

Create `/lib/features/wishlist/data/repositories/wishlist_repository_impl.dart`:

```dart
import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/core/errors/handler/error_handler.dart';
import 'package:groozil_app/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:groozil_app/features/wishlist/data/mappers/wishlist_item_mapper.dart';
import 'package:groozil_app/features/wishlist/data/mappers/wishlist_mapper.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:groozil_app/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:groozil_app/features/wishlist/domain/repostories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl(this._remoteDataSource);
  
  final WishlistRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, WishlistEntity>> getWishlist() async {
    return ErrorHandler.handleRepositoryCall(
      call: () async {
        final wishlistModel = await _remoteDataSource.getWishlist();
        return wishlistModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, WishlistItem>> addToWishlist({
    required String productId,
    String? notes,
    int? priority,
    bool? notifyOnDiscount,
    bool? notifyOnStock,
  }) async {
    return ErrorHandler.handleRepositoryCall(
      call: () async {
        final itemModel = await _remoteDataSource.addToWishlist(
          productId: productId,
          notes: notes,
          priority: priority,
          notifyOnDiscount: notifyOnDiscount,
          notifyOnStock: notifyOnStock,
        );
        return itemModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, void>> removeFromWishlist(String wishlistItemId) async {
    return ErrorHandler.handleRepositoryCall(
      call: () async {
        await _remoteDataSource.removeFromWishlist(wishlistItemId);
      },
    );
  }

  @override
  Future<Either<Failure, void>> clearWishlist() async {
    // TODO: Implement clear wishlist if API supports it
    throw UnimplementedError();
  }
}
```

### 3. Update WishlistRemoteDataSource

Replace the current file with this Retrofit-compatible version:

```dart
import 'package:groozil_app/core/network/client/api_client.dart';
import 'package:groozil_app/features/wishlist/data/models/wishlist_item_model.dart';
import 'package:groozil_app/features/wishlist/data/models/wishlist_model.dart';
import 'package:injectable/injectable.dart';

abstract class WishlistRemoteDataSource {
  Future<WishlistModel> getWishlist();
  
  Future<WishlistItemModel> addToWishlist({
    required String productId,
    String? notes,
    int? priority,
    bool? notifyOnDiscount,
    bool? notifyOnStock,
  });
  
  Future<void> removeFromWishlist(String wishlistItemId);
}

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  WishlistRemoteDataSourceImpl(this._apiClient);
  
  final ApiClient _apiClient;

  @override
  Future<WishlistModel> getWishlist() async {
    final response = await _apiClient.getWishlist();
    return response.data!;
  }

  @override
  Future<WishlistItemModel> addToWishlist({
    required String productId,
    String? notes,
    int? priority,
    bool? notifyOnDiscount,
    bool? notifyOnStock,
  }) async {
    final body = <String, dynamic>{
      'productId': productId,
      if (notes != null) 'notes': notes,
      if (priority != null) 'priority': priority,
      if (notifyOnDiscount != null) 'notifyOnDiscount': notifyOnDiscount,
      if (notifyOnStock != null) 'notifyOnStock': notifyOnStock,
    };

    final response = await _apiClient.addToWishlist(body);
    return response.data!;
  }

  @override
  Future<void> removeFromWishlist(String wishlistItemId) async {
    await _apiClient.removeFromWishlist(wishlistItemId);
  }
}
```

### 4. Run Build Runner

```bash
dart run build_runner build --delete-conflicting-outputs
```

This will generate:
- wishlist_item.freezed.dart
- wishlist_entity.freezed.dart
- wishlist_item_model.freezed.dart & .g.dart
- wishlist_model.freezed.dart & .g.dart
- api_client.g.dart (updated)
- injection.config.dart (updated)

### 5. Update WishlistNotifier

The current wishlist notifier uses local Set<String>. You'll need to update it to use the API.

## 📝 Notes

- All domain entities use freezed for immutability
- All data models use freezed + json_serializable
- Repository pattern with Either<Failure, T> for error handling
- Dependency injection with injectable
- The wishlist API returns a default wishlist with items array
- Each item has the full product object embedded

## 🚀 Testing

After completing the above:
1. Run build_runner
2. The app should compile without errors
3. The wishlist will fetch from API instead of local state
4. Adding/removing favorites will call the API
5. The wishlist screen will show real data

