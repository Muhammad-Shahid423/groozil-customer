import 'package:groozil_app/core/network/client/api_client.dart';
import 'package:groozil_app/features/home/data/models/banner_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getBanners();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {

  HomeRemoteDataSourceImpl(this._apiClient);
  final ApiClient _apiClient;

  @override
  Future<List<BannerModel>> getBanners() async {
    final queries = <String,dynamic>{}
    ..putIfAbsent('active', ()=> true);
    final response = await _apiClient.getBanners(queries);
    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }
}
