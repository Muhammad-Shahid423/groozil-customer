import 'package:groozil_app/core/network/client/api_client.dart';
import 'package:groozil_app/features/category/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {

  CategoryRemoteDataSourceImpl(this._apiClient);
  final ApiClient _apiClient;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiClient.getCategories();
    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }
}
