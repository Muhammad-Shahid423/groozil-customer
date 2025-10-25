class RouteNames {
  RouteNames._();

  // Core
  static const String splash = '/';
  static const String error = '/error';

  // Auth (Phase 2)
  static const String onboarding = '/onboarding';
  static const String phoneInput = '/auth/phone';
  static const String otpVerification = '/auth/otp';
  static const String profileSetup = '/auth/profile-setup';

  // Main
  static const String home = '/home';
  static const String categories = '/categories';
  static const String search = '/search';
  static const String cart = '/cart';
  static const String profile = '/profile';

  // Products (Phase 3)
  static const String productDetails = '/product/:id';
  static const String productReviews = '/product/:id/reviews';

  // Orders (Phase 4)
  static const String checkout = '/checkout';
  static const String orderSuccess = '/order/success';
  static const String orders = '/orders';
  static const String orderDetails = '/order/:id';
  static const String orderTracking = '/order/:id/tracking';

  // Profile
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
  static const String notifications = '/notifications';
}
