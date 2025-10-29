import 'package:dio/dio.dart';
import 'package:groozil_app/core/network/api_constants.dart';
import 'package:groozil_app/core/network/models/api_response.dart';
import 'package:groozil_app/features/auth/data/models/auth_response_model.dart';
import 'package:groozil_app/features/auth/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // ==================== HEALTH CHECK ====================
  @GET('/health')
  Future<ApiResponse<dynamic>> checkHealth();

  // ==================== AUTH ENDPOINTS ====================
  @POST(ApiConstants.sendOtp)
  Future<ApiResponse<dynamic>> sendOtp(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.verifyOtp)
  Future<ApiResponse<AuthResponseModel>> verifyOtp(@Body() Map<String, dynamic> body);

  // @POST('/auth/refresh')
  // Future<ApiResponse<Map<String, dynamic>>> refreshToken(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.logout)
  Future<ApiResponse<dynamic>> logout();

  @POST(ApiConstants.googleAuth)
  Future<ApiResponse<AuthResponseModel>> googleAuth(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.appleAuth)
  Future<ApiResponse<AuthResponseModel>> appleAuth(@Body() Map<String, dynamic> body);
 
  // ==================== USER ENDPOINTS ====================
  @GET(ApiConstants.profile)
  Future<ApiResponse<UserModel>> getProfile();

  @PUT(ApiConstants.profile)
  Future<ApiResponse<AuthResponseModel>> updateProfile(@Body() Map<String, dynamic> body);

  // @DELETE('/user/account')
  // Future<ApiResponse<dynamic>> deleteAccount();
  //
  // // ==================== PRODUCTS ENDPOINTS ====================
  // @GET('/products')
  // Future<ApiResponse<List<dynamic>>> getProducts(
  //     @Query('page') int page,
  //     @Query('limit') int limit,
  //     @Query('category') String? category,
  //     @Query('search') String? search,
  //     @Query('sort') String? sort,
  //     @Query('minPrice') double? minPrice,
  //     @Query('maxPrice') double? maxPrice,
  //     );
  //
  // @GET('/products/{id}')
  // Future<ApiResponse<Map<String, dynamic>>> getProductById(
  //     @Path('id') String id,
  //     );
  //
  // @GET('/products/search')
  // Future<ApiResponse<List<dynamic>>> searchProducts(
  //     @Query('q') String query,
  //     @Query('page') int page,
  //     @Query('limit') int limit,
  //     );
  //
  // @GET('/products/{id}/reviews')
  // Future<ApiResponse<List<dynamic>>> getProductReviews(
  //     @Path('id') String id,
  //     @Query('page') int page,
  //     @Query('limit') int limit,
  //     );
  //
  // @POST('/products/{id}/reviews')
  // Future<ApiResponse<Map<String, dynamic>>> addProductReview(
  //     @Path('id') String id,
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @GET('/products/featured')
  // Future<ApiResponse<List<dynamic>>> getFeaturedProducts(
  //     @Query('limit') int limit,
  //     );
  //
  // @GET('/products/recommended')
  // Future<ApiResponse<List<dynamic>>> getRecommendedProducts(
  //     @Query('limit') int limit,
  //     );
  //
  // // ==================== CATEGORIES ENDPOINTS ====================
  // @GET('/categories')
  // Future<ApiResponse<List<dynamic>>> getCategories();
  //
  // @GET('/categories/{id}')
  // Future<ApiResponse<Map<String, dynamic>>> getCategoryById(
  //     @Path('id') String id,
  //     );
  //
  // @GET('/categories/{id}/products')
  // Future<ApiResponse<List<dynamic>>> getCategoryProducts(
  //     @Path('id') String id,
  //     @Query('page') int page,
  //     @Query('limit') int limit,
  //     );
  //
  // // ==================== CART ENDPOINTS ====================
  // @GET('/cart')
  // Future<ApiResponse<Map<String, dynamic>>> getCart();
  //
  // @POST('/cart/add')
  // Future<ApiResponse<Map<String, dynamic>>> addToCart(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @PUT('/cart/update')
  // Future<ApiResponse<Map<String, dynamic>>> updateCartItem(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @DELETE('/cart/remove/{itemId}')
  // Future<ApiResponse<dynamic>> removeFromCart(@Path('itemId') String itemId);
  //
  // @DELETE('/cart/clear')
  // Future<ApiResponse<dynamic>> clearCart();
  //
  // @POST('/cart/apply-coupon')
  // Future<ApiResponse<Map<String, dynamic>>> applyCoupon(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @DELETE('/cart/remove-coupon')
  // Future<ApiResponse<Map<String, dynamic>>> removeCoupon();
  //
  // // ==================== WISHLIST ENDPOINTS ====================
  // @GET('/wishlist')
  // Future<ApiResponse<List<dynamic>>> getWishlist(
  //     @Query('page') int page,
  //     @Query('limit') int limit,
  //     );
  //
  // @POST('/wishlist/add')
  // Future<ApiResponse<dynamic>> addToWishlist(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @DELETE('/wishlist/remove/{productId}')
  // Future<ApiResponse<dynamic>> removeFromWishlist(
  //     @Path('productId') String productId,
  //     );
  //
  // @DELETE('/wishlist/clear')
  // Future<ApiResponse<dynamic>> clearWishlist();
  //
  // // ==================== ORDERS ENDPOINTS ====================
  // @GET('/orders')
  // Future<ApiResponse<List<dynamic>>> getOrders(
  //     @Query('page') int page,
  //     @Query('limit') int limit,
  //     @Query('status') String? status,
  //     );
  //
  // @GET('/orders/{id}')
  // Future<ApiResponse<Map<String, dynamic>>> getOrderById(@Path('id') String id);
  //
  // @POST('/orders/place')
  // Future<ApiResponse<Map<String, dynamic>>> placeOrder(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @PUT('/orders/{id}/cancel')
  // Future<ApiResponse<Map<String, dynamic>>> cancelOrder(@Path('id') String id);
  //
  // @GET('/orders/{id}/track')
  // Future<ApiResponse<Map<String, dynamic>>> trackOrder(@Path('id') String id);
  //
  // @POST('/orders/{id}/rate')
  // Future<ApiResponse<Map<String, dynamic>>> rateOrder(
  //     @Path('id') String id,
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // // ==================== ADDRESS ENDPOINTS ====================
  // @GET('/addresses')
  // Future<ApiResponse<List<dynamic>>> getAddresses();
  //
  // @GET('/addresses/{id}')
  // Future<ApiResponse<Map<String, dynamic>>> getAddressById(
  //     @Path('id') String id,
  //     );
  //
  // @POST('/addresses')
  // Future<ApiResponse<Map<String, dynamic>>> addAddress(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @PUT('/addresses/{id}')
  // Future<ApiResponse<Map<String, dynamic>>> updateAddress(
  //     @Path('id') String id,
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @DELETE('/addresses/{id}')
  // Future<ApiResponse<dynamic>> deleteAddress(@Path('id') String id);
  //
  // @PUT('/addresses/{id}/set-default')
  // Future<ApiResponse<Map<String, dynamic>>> setDefaultAddress(
  //     @Path('id') String id,
  //     );
  //
  // // ==================== PAYMENT ENDPOINTS ====================
  // @GET('/payment/methods')
  // Future<ApiResponse<List<dynamic>>> getPaymentMethods();
  //
  // @POST('/payment/process')
  // Future<ApiResponse<Map<String, dynamic>>> processPayment(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @POST('/payment/verify')
  // Future<ApiResponse<Map<String, dynamic>>> verifyPayment(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // // ==================== NOTIFICATIONS ENDPOINTS ====================
  // @GET('/notifications')
  // Future<ApiResponse<List<dynamic>>> getNotifications(
  //     @Query('page') int page,
  //     @Query('limit') int limit,
  //     @Query('unreadOnly') bool? unreadOnly,
  //     );
  //
  // @PUT('/notifications/{id}/read')
  // Future<ApiResponse<dynamic>> markNotificationAsRead(@Path('id') String id);
  //
  // @PUT('/notifications/read-all')
  // Future<ApiResponse<dynamic>> markAllNotificationsAsRead();
  //
  // @DELETE('/notifications/clear')
  // Future<ApiResponse<dynamic>> clearNotifications();
  //
  // @PUT('/notifications/fcm-token')
  // Future<ApiResponse<dynamic>> updateFcmToken(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // // ==================== BANNERS ENDPOINTS ====================
  // @GET('/banners')
  // Future<ApiResponse<List<dynamic>>> getBanners(
  //     @Query('active') bool? active,
  //     );
  //
  // @GET('/banners/{id}')
  // Future<ApiResponse<Map<String, dynamic>>> getBannerById(@Path('id') String id);
  //
  // // ==================== SETTINGS ENDPOINTS ====================
  // @GET('/settings')
  // Future<ApiResponse<Map<String, dynamic>>> getSettings();
  //
  // @GET('/settings/app')
  // Future<ApiResponse<Map<String, dynamic>>> getAppSettings();
  //
  // // ==================== SUPPORT ENDPOINTS ====================
  // @POST('/support')
  // Future<ApiResponse<dynamic>> sendSupportMessage(
  //     @Body() Map<String, dynamic> body,
  //     );
  //
  // @GET('/support/tickets')
  // Future<ApiResponse<List<dynamic>>> getSupportTickets(
  //     @Query('page') int page,
  //     @Query('limit') int limit,
  //     );
  //
  // @GET('/support/tickets/{id}')
  // Future<ApiResponse<Map<String, dynamic>>> getSupportTicketById(
  //     @Path('id') String id,
  //     );
  //
  // // ==================== FAQ ENDPOINTS ====================
  // @GET('/faq')
  // Future<ApiResponse<List<dynamic>>> getFaq();
  //
  // @GET('/faq/categories')
  // Future<ApiResponse<List<dynamic>>> getFaqCategories();
  //
  // // ==================== SEARCH ENDPOINTS ====================
  // @GET('/search')
  // Future<ApiResponse<Map<String, dynamic>>> globalSearch(
  //     @Query('q') String query,
  //     @Query('type') String? type,
  //     );
}
