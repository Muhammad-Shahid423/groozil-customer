import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();

  // API Version
  static const String apiVersion = 'v1';

  static final String apiBaseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000/api';

  // Auth Endpoints
  static const String sendOtp = '/auth/send-otp';
  static const String verifyOtp = '/auth/verify-otp';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String googleAuth = '/auth/google';
  static const String appleAuth = '/auth/apple';

  // User Endpoints
  static const String profile = '/users/me';
  static const String updateLanguage = '/users/me/language';
  static const String deleteAccount = '/user/account';

  // Products Endpoints
  static const String products = '/products';
  static String productDetails(String id) => '/products/$id';
  static const String searchProducts = '/products/search';
  static String productReviews(String id) => '/products/$id/reviews';
  static String addProductReview(String id) => '/products/$id/reviews';
  static const String featuredProducts = '/products/featured';
  static const String recommendedProducts = '/products/recommended';

  // Categories Endpoints
  static const String categories = '/categories';
  static String categoryDetails(String id) => '/categories/$id';
  static String categoryProducts(String id) => '/categories/$id/products';

  // Cart Endpoints
  static const String cart = '/cart';
  static const String addToCart = '/cart/add';
  static const String updateCartItem = '/cart/update';
  static String removeFromCart(String itemId) => '/cart/remove/$itemId';
  static const String clearCart = '/cart/clear';
  static const String applyCoupon = '/cart/apply-coupon';
  static const String removeCoupon = '/cart/remove-coupon';

  // Wishlist Endpoints
  static const String wishlist = '/wishlist';
  static const String addToWishlist = '/wishlist/add';
  static String removeFromWishlist(String productId) => '/wishlist/remove/$productId';
  static const String clearWishlist = '/wishlist/clear';

  // Orders Endpoints
  static const String orders = '/orders';
  static String orderDetails(String id) => '/orders/$id';
  static const String placeOrder = '/orders/place';
  static String cancelOrder(String id) => '/orders/$id/cancel';
  static String trackOrder(String id) => '/orders/$id/track';
  static String rateOrder(String id) => '/orders/$id/rate';

  // Address Endpoints
  static const String addresses = '/addresses';
  static String addressDetails(String id) => '/addresses/$id';
  static const String addAddress = '/addresses';
  static String updateAddress(String id) => '/addresses/$id';
  static String deleteAddress(String id) => '/addresses/$id';
  static String setDefaultAddress(String id) => '/addresses/$id/set-default';

  // Payment Endpoints
  static const String paymentMethods = '/payment/methods';
  static const String processPayment = '/payment/process';
  static const String verifyPayment = '/payment/verify';

  // Notifications Endpoints
  static const String notifications = '/notifications';
  static String markNotificationRead(String id) => '/notifications/$id/read';
  static const String markAllNotificationsRead = '/notifications/read-all';
  static const String clearNotifications = '/notifications/clear';
  static const String updateFcmToken = '/notifications/fcm-token';

  // Banners Endpoints
  static const String banners = '/banners';
  static String bannerDetails(String id) => '/banners/$id';

  // Settings Endpoints
  static const String settings = '/settings';
  static const String appSettings = '/settings/app';

  // Support Endpoints
  static const String support = '/support';
  static const String supportTickets = '/support/tickets';
  static String supportTicketDetails(String id) => '/support/tickets/$id';

  // FAQ Endpoints
  static const String faq = '/faq';
  static const String faqCategories = '/faq/categories';

  // Search Endpoints
  static const String globalSearch = '/search';

  // Health Check
  static const String health = '/health';
}
