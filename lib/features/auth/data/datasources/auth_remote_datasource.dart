import 'package:groozil_app/core/network/client/api_client.dart';
import 'package:groozil_app/features/auth/data/models/auth_response_model.dart';
import 'package:groozil_app/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<void> sendOtp({String? phone, String? email});
  Future<AuthResponseModel> verifyOtp({String? phone, String? email, required String otp});
  Future<AuthResponseModel> googleSignIn(String idToken);
  Future<AuthResponseModel> appleSignIn(String idToken);
  Future<UserModel> updateProfile({required String name, String? phone, String? email});
  Future<void> logout();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  AuthRemoteDataSourceImpl(this._apiClient);
  final ApiClient _apiClient;

  @override
  Future<void> sendOtp({String? phone, String? email}) async {
    final body = <String, dynamic>{};
    if (phone != null) body['phone'] = phone;
    if (email != null) body['email'] = email;
    
    await _apiClient.sendOtp(body);
  }

  @override
  Future<AuthResponseModel> verifyOtp({String? phone, String? email, required String otp}) async {
    final body = <String, dynamic>{'code': otp};
    if (phone != null) body['phone'] = phone;
    if (email != null) body['email'] = email;
    
    final response = await _apiClient.verifyOtp(body);

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<AuthResponseModel> googleSignIn(String idToken) async {
    final response = await _apiClient.googleAuth({
      'idToken': idToken,
    });

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<AuthResponseModel> appleSignIn(String idToken) async {
    final response = await _apiClient.appleAuth({
      'idToken': idToken,
    });

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<UserModel> updateProfile({
    required String name,
    String? phone,
    String? email,
  }) async {
    final body = <String, dynamic>{'name': name};
    if (phone != null) body['phone'] = phone;
    if (email != null) body['email'] = email;
    
    final response = await _apiClient.updateProfile(body);

    if ((response.success ?? false) && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message);
    }
  }

  @override
  Future<void> logout() async {
    final response = await _apiClient.logout();

    if (response.success == false) {
      throw Exception(response.message);
    }
  }
}
