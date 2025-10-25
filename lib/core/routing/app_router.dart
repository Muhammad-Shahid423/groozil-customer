import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/routing/route_names.dart';
import 'package:groozil_app/shared/screens/splash_screen.dart';
import 'package:groozil_app/shared/widgets/error/error_screen.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppRouter {

  AppRouter() {
    _router = GoRouter(
      navigatorKey: NavigationService.navigatorKey,
      routes: _buildRoutes(),
      errorBuilder: (context, state) => ErrorScreen(
        error: state.error?.message ?? 'Page not found',
      ),
    );
  }

  late final GoRouter _router;
  GoRouter get router => _router;

  // AppLocalizations? get loc =>
  //     _router.routerDelegate.navigatorKey.currentContext?.loc;

  void dispose() {
    _router.dispose();
  }

  List<GoRoute> _buildRoutes() {
    return [
      // Splash Screen
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Onboarding
      GoRoute(
        path: RouteNames.onboarding,
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Auth Routes
      GoRoute(
        path: RouteNames.phoneInput,
        name: RouteNames.phoneInput,
        builder: (context, state) => const LoginScreen(),
      ),

      // Main App Routes
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ];
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Onboarding Screen')),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Login Screen')),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home Screen')),
    );
  }
}
