import 'dart:convert';

import 'package:groozil_app/core/services/storage/storage_service.dart';
import 'package:groozil_app/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens(String accessToken, String refreshToken);
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearAuthData();
  Future<bool> isLoggedIn();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {

  AuthLocalDataSourceImpl(this._storageService);

  final StorageService _storageService;

  static const String _userKey = 'cached_user';

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _storageService.setAccessToken(accessToken);
    await _storageService.setRefreshToken(refreshToken);
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final userJson = json.encode(user.toJson());
    await _storageService.setString(_userKey, userJson);
    if (user.id.isNotEmpty) {
      await _storageService.setUserId(user.id);
    }
    if (user.phone != null && user.phone!.isNotEmpty) {
      await _storageService.setUserPhone(user.phone!);
    }
  }

  @override
  Future<UserModel?> getUser() async {
    final userJson = _storageService.getString(_userKey);
    if (userJson != null && userJson.isNotEmpty) {
      return UserModel.fromJson(json.decode(userJson) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<String?> getAccessToken() async {
    return _storageService.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storageService.getRefreshToken();
  }

  @override
  Future<void> clearAuthData() async {
    await _storageService.clearTokens();
    await _storageService.removeString(_userKey);
    await _storageService.clearAll();
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = _storageService.getAccessToken();
    final user = await getUser();
    return token != null && token.isNotEmpty && user != null;
  }
}
