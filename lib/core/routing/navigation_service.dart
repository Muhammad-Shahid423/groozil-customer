import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groozil_app/core/routing/route_names.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentContext!;

  static void goToLogin() => context.go(RouteNames.phoneInput);
  static void goToHome() => context.go(RouteNames.home);

  static void goTo(String route, {Object? extra}) => context.go(route, extra: extra);
  static Future<Object?> pushTo(String route, {Object? extra}) => context.push(route, extra: extra);

  static void goBack({bool pop = false}) => navigatorKey.currentState!.pop(pop);
}
