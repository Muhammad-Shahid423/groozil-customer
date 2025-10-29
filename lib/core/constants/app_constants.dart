class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Groozil';
  static const String appVersion = '1.0.0';

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 50;

  // Cache
  static const Duration cacheExpiration = Duration(hours: 24);

  // Image
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageFormats = ['jpg', 'jpeg', 'png', 'webp'];

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 20;
  static const int phoneNumberLength = 9;

  // Map
  static const double defaultLatitude = 26.4207;
  static const double defaultLongitude = 50.0888;
  static const double defaultZoom = 14;

  // Currency
  static const String currency = 'SAR';
  static const String currencySymbol = 'ر.س';

  // Date Format
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm';

  // Support
  static const String supportEmail = 'support@groozil.com';
  static const String supportPhone = '+966123456789';
}
