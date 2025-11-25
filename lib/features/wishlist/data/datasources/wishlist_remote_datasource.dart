import 'package:groozil_app/core/network/client/api_client.dart';
import 'package:groozil_app/features/wishlist/data/models/wishlist_item_model.dart';
import 'package:groozil_app/features/wishlist/data/models/wishlist_model.dart';
import 'package:injectable/injectable.dart';

abstract class WishlistRemoteDataSource {
  Future<WishlistModel?> getWishlist();
  
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
  Future<WishlistModel?> getWishlist() async {
    final response = await _apiClient.getWishlist();
    return response.data;
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
      'notes': ?notes,
      'priority': ?priority,
      'notifyOnDiscount': ?notifyOnDiscount,
      'notifyOnStock': ?notifyOnStock,
    };

    final response = await _apiClient.addToWishlist(body);
    
    // The API might return the full wishlist or just the added item
    // Handle both cases
    if (response.data is Map<String, dynamic>) {
      return WishlistItemModel.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception('Invalid response format from addToWishlist API');
    }
  }

  @override
  Future<void> removeFromWishlist(String wishlistItemId) async {
    await _apiClient.removeFromWishlist(wishlistItemId);
  }
}
