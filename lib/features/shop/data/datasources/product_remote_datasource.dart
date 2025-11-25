import 'package:groozil_app/core/network/client/api_client.dart';
import 'package:groozil_app/features/shop/data/models/product_model.dart';
import 'package:groozil_app/features/shop/domain/entities/product_filter.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int limit = 20,
    ProductFilter? filter,
  });

  Future<ProductModel> getProductById(String id);

  Future<List<ProductModel>> searchProducts(String query);

  Future<List<ProductModel>> getProductsByCategory(
      String categoryId, {
        int page = 1,
        int limit = 20,
        ProductFilter? filter,
      });

  Future<List<ProductModel>> getFeaturedProducts();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {

  ProductRemoteDataSourceImpl(this._apiClient);
  final ApiClient _apiClient;

  @override
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int limit = 20,
    ProductFilter? filter,
  }) async {
    final queryParams = <String, dynamic> {
      'page': page,
      'limit': limit,
    };

    if (filter != null) {
      // if (filter.inStock != null) {
      //   queryParams['inStock'] = filter.inStock;
      // }
      if (filter.minPrice != null) {
        queryParams['minPrice'] = filter.minPrice;
      }
      if (filter.maxPrice != null) {
        queryParams['maxPrice'] = filter.maxPrice;
      }
      if (filter.minRating != null) {
        queryParams['minRating'] = filter.minRating;
      }
      if (filter.categoryId != null) {
        queryParams['category'] = filter.categoryId;
      }
      if (filter.sortBy != null) {
        queryParams['sort'] = filter.sortBy;
      }
    }

    final response = await _apiClient.getProducts(queryParams);

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await _apiClient.getProductById(id);

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final queryParams = <String, dynamic>{
      'q': query,
    };
    final response = await _apiClient.searchProducts(queryParams);

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(
      String categoryId, {
        int page = 1,
        int limit = 20,
        ProductFilter? filter,
      }) async {
    final queryParams = <String, dynamic> {
      'page': page,
      'limit': limit,
    };
    if (filter != null) {
      // if (filter.inStock != null) {
      //   queryParams['inStock'] = filter.inStock;
      // }
      if (filter.minPrice != null) {
        queryParams['minPrice'] = filter.minPrice;
      }
      if (filter.maxPrice != null) {
        queryParams['maxPrice'] = filter.maxPrice;
      }
      if (filter.minRating != null) {
        queryParams['minRating'] = filter.minRating;
      }
      if (filter.categoryId != null) {
        queryParams['category'] = filter.categoryId;
      }
      if (filter.sortBy != null) {
        queryParams['sort'] = filter.sortBy;
      }
    }

    final response = await _apiClient.getCategoryProducts(categoryId, queryParams);

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<List<ProductModel>> getFeaturedProducts() async {
    final queryParams = <String, dynamic>{
      'limit': 10,
    };
    final response = await _apiClient.getFeaturedProducts(queryParams);

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }
}
