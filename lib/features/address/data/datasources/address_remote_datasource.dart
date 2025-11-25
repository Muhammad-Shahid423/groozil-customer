import 'package:groozil_app/core/network/client/api_client.dart';
import 'package:groozil_app/features/address/data/models/address_model.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:injectable/injectable.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressModel>> getAddresses();
  Future<AddressModel> getAddressById(String id);
  Future<AddressModel> addAddress(AddressParams params);
  Future<AddressModel> updateAddress(String id, AddressParams params);
  Future<void> deleteAddress(String id);
  Future<void> setDefaultAddress(String id);
}

@LazySingleton(as: AddressRemoteDataSource)
class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  AddressRemoteDataSourceImpl(this._apiClient);
  
  final ApiClient _apiClient;

  @override
  Future<List<AddressModel>> getAddresses() async {
    final response = await _apiClient.getAddresses();
    return response.data ?? [];
  }

  @override
  Future<AddressModel> getAddressById(String id) async {
    final response = await _apiClient.getAddressById(id);
    if (response.data == null) {
      throw Exception('Address not found');
    }
    return response.data!;
  }

  @override
  Future<AddressModel> addAddress(AddressParams params) async {
    final response = await _apiClient.addAddress(params.toJson());
    if (response.data == null) {
      throw Exception('Failed to add address');
    }
    return response.data!;
  }

  @override
  Future<AddressModel> updateAddress(String id, AddressParams params) async {
    final response = await _apiClient.updateAddress(id, params.toJson());
    if (response.data == null) {
      throw Exception('Failed to update address');
    }
    return response.data!;
  }

  @override
  Future<void> deleteAddress(String id) async {
    await _apiClient.deleteAddress(id);
  }

  @override
  Future<void> setDefaultAddress(String id) async {
    await _apiClient.setDefaultAddress(id);
  }
}
