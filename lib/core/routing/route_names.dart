class RouteNames {
  RouteNames._();

  // Core
  static const String splash = '/';
  static const String error = '/error';

  // Auth (Phase 2)
  static const String onboarding = '/onboarding';
  static const String authOptions = '/auth-options';
  static const String phoneInput = '/auth/phone';
  static const String emailInput = '/auth/email';
  static const String otpVerification = '/auth/otp';
  static const String profileSetup = '/auth/profile-setup';

  // Main
  static const String home = '/home';
  static const String categories = '/categories';
  static const String shop = '/shop';
  static const String search = '/search';
  static const String orderHistory = '/cart';
  static const String cart = '/cart';
  static const String profile = '/profile';

  // Products (Phase 3)
  static const String productDetails = '/product-details';
  static const String productReviews = '/product/:id/reviews';
  static const String wishlist = '/wishlist';
  static const String featuredProducts = '/featured-products';

  // Address
  static const String addresses = '/addresses';
  static const String addAddress = '/add-address';
  static const String editAddress = '/edit-address';
  static const String selectLocation = '/select-location';

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
