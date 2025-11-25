import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groozil_app/core/routing/route_names.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentContext!;

  static void goToAuthOptions() => context.go(RouteNames.authOptions);
  static void goToHome() => context.go(RouteNames.home);
  static void goToShop() => context.go(RouteNames.shop);
  static void goToOrderHistory() => context.go(RouteNames.orderHistory);
  static void goToProfile() => context.go(RouteNames.profile);
  static void goToCart() => context.push(RouteNames.cart);
  static void goToWishlist() => context.push(RouteNames.wishlist);
  static Future<void> goToProductDetails(String id, {Object? product}) => 
      context.push('${RouteNames.productDetails}/$id', extra: product);
  
  // Address routes
  static void goToAddresses() => context.push(RouteNames.addresses);
  static void goToAddAddress() => context.push(RouteNames.addAddress);
  static void goToEditAddress(String id, {Object? address}) => 
      context.push('${RouteNames.editAddress}/$id', extra: address);
  static Future<Map<String, dynamic>?> goToSelectLocation(
    double? initialLat,
    double? initialLng,
  ) async {
    final result = await context.push(
      RouteNames.selectLocation,
      extra: {
        'latitude': initialLat,
        'longitude': initialLng,
      },
    );
    return result as Map<String, dynamic>?;
  }
  
  // static void goToFeaturedProducts() => context.push(RouteNames.wishlist);

  static void goTo(String route, {Object? extra}) => context.go(route, extra: extra);
  static Future<Object?> pushTo(String route, {Object? extra}) => context.push(route, extra: extra);

  static void goBack({bool pop = false}) => navigatorKey.currentState!.pop(pop);
}
