import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:groozil_app/core/services/storage/storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: StorageService)
class StorageServiceImpl implements StorageService {
  StorageServiceImpl(this._sharedPreferences, this._secureStorage);

  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage;

  // Keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _languageKey = 'language';
  static const String _themeModeKey = 'theme_mode';
  static const String _onboardingKey = 'onboarding_completed';
  static const String _userIdKey = 'user_id';
  static const String _userPhoneKey = 'user_phone';

  @override
  Future<void> setAccessToken(String token) async {
    await _secureStorage.write(key: _accessTokenKey, value: token);
    await _sharedPreferences.setString(_accessTokenKey, token);
  }

  @override
  String? getAccessToken() {
    return _sharedPreferences.getString(_accessTokenKey);
  }

  @override
  Future<void> setRefreshToken(String token) async {
    await _secureStorage.write(key: _refreshTokenKey, value: token);
    await _sharedPreferences.setString(_refreshTokenKey, token);
  }

  @override
  String? getRefreshToken() {
    return _sharedPreferences.getString(_refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    await _sharedPreferences.remove(_accessTokenKey);
    await _sharedPreferences.remove(_refreshTokenKey);
  }

  @override
  Future<void> setLanguage(String language) async {
    await _sharedPreferences.setString(_languageKey, language);
  }

  @override
  String? getLanguage() {
    return _sharedPreferences.getString(_languageKey);
  }

  @override
  Future<void> setThemeMode(String theme) async {
    await _sharedPreferences.setString(_themeModeKey, theme);
  }

  @override
  String? getThemeMode() {
    return _sharedPreferences.getString(_themeModeKey);
  }

  @override
  Future<void> setOnboardingCompleted({bool completed = false}) async {
    await _sharedPreferences.setBool(_onboardingKey, completed);
  }

  @override
  bool getOnboardingCompleted() {
    return _sharedPreferences.getBool(_onboardingKey) ?? false;
  }

  @override
  Future<void> setUserId(String id) async {
    await _sharedPreferences.setString(_userIdKey, id);
  }

  @override
  String? getUserId() {
    return _sharedPreferences.getString(_userIdKey);
  }

  @override
  Future<void> setUserPhone(String phone) async {
    await _sharedPreferences.setString(_userPhoneKey, phone);
  }

  @override
  String? getUserPhone() {
    return _sharedPreferences.getString(_userPhoneKey);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<void> removeString(String key) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<void> clearAll() async {
    await clearTokens();
    final onboardingCompleted = getOnboardingCompleted();
    await _sharedPreferences.clear();
    await _secureStorage.deleteAll();
    // Restore onboarding status
    if (onboardingCompleted) {
      await setOnboardingCompleted(completed: true);
    }
  }
}
