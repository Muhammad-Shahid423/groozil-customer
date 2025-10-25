abstract class StorageService {
  // Auth tokens
  Future<void> setAccessToken(String token);
  String? getAccessToken();
  Future<void> setRefreshToken(String token);
  String? getRefreshToken();
  Future<void> clearTokens();

  // User preferences
  Future<void> setLanguage(String language);
  String? getLanguage();
  Future<void> setThemeMode(String theme);
  String? getThemeMode();
  Future<void> setOnboardingCompleted({bool completed});
  bool getOnboardingCompleted();

  // User data
  Future<void> setUserId(String id);
  String? getUserId();
  Future<void> setUserPhone(String phone);
  String? getUserPhone();

  // Generic string storage
  Future<void> setString(String key, String value);
  String? getString(String key);
  Future<void> removeString(String key);

  // Clear all data
  Future<void> clearAll();
}
