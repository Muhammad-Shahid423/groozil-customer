import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groozil_app/core/di/injection.dart';
import 'package:groozil_app/core/extensions/type_checkers.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/routing/route_names.dart';
import 'package:groozil_app/core/services/storage/storage_service.dart';
import 'package:groozil_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:groozil_app/features/auth/presentation/screens/auth_options_screen.dart';
import 'package:groozil_app/features/auth/presentation/screens/complete_profile_screen.dart';
import 'package:groozil_app/features/auth/presentation/screens/email_login_screen.dart';
import 'package:groozil_app/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:groozil_app/features/auth/presentation/screens/phone_login_screen.dart';
import 'package:groozil_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:groozil_app/shared/screens/splash_screen.dart';
import 'package:groozil_app/shared/widgets/error/error_screen.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppRouter {

  AppRouter() {
    _router = GoRouter(
      navigatorKey: NavigationService.navigatorKey,
      initialLocation: RouteNames.splash,
      debugLogDiagnostics: true,
      redirect: (context, state) async {
        final authLocalDataSource = getIt<AuthLocalDataSource>();
        final storageService = getIt<StorageService>();

        final isLoggedIn = await authLocalDataSource.isLoggedIn();
        final onboardingCompleted = storageService.getOnboardingCompleted();
        final currentUser = await authLocalDataSource.getUser();

        final isGoingToOnboarding = state.matchedLocation == RouteNames.onboarding;
        final isGoingToProfileSetup = state.matchedLocation.startsWith(RouteNames.profileSetup);
        final isGoingToAuth = state.matchedLocation.startsWith('/auth') ||
            state.matchedLocation == RouteNames.phoneInput ||
            state.matchedLocation == RouteNames.emailInput ||
            state.matchedLocation.startsWith(RouteNames.otpVerification);

        // Check if user has completed profile (has a name)
        final hasCompletedProfile = currentUser?.name.isNotNullOrEmpty ?? false;

        // If not logged in and onboarding not completed, go to onboarding
        if (!isLoggedIn && !onboardingCompleted && !isGoingToOnboarding) {
          return RouteNames.onboarding;
        }

        // If not logged in but onboarding completed, go to auth options
        if (!isLoggedIn && onboardingCompleted && !isGoingToAuth) {
          return RouteNames.authOptions;
        }

        // If logged in but profile not completed, allow profile setup
        if (isLoggedIn && !hasCompletedProfile && !isGoingToProfileSetup) {
          return null; // Let the navigation continue to profile setup
        }

        // If logged in with completed profile and trying to access onboarding/auth/profile setup, redirect to home
        if (isLoggedIn && hasCompletedProfile && (isGoingToOnboarding || isGoingToAuth || isGoingToProfileSetup)) {
          return RouteNames.home;
        }

        return null;
      },
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

      GoRoute(
        path: RouteNames.authOptions,
        builder: (context, state) => const AuthOptionsScreen(),
      ),
      GoRoute(
        path: RouteNames.phoneInput,
        builder: (context, state) => const PhoneLoginScreen(),
      ),
      GoRoute(
        path: RouteNames.otpVerification,
        builder: (context, state) {
          final phone = state.uri.queryParameters['phone'];
          final email = state.uri.queryParameters['email'];
          return OtpVerificationScreen(
            phone: phone,
            email: email,
          );
        },
      ),
      GoRoute(
        path: RouteNames.emailInput,
        builder: (context, state) => const EmailLoginScreen(),
      ),
      GoRoute(
        path: RouteNames.profileSetup,
        builder: (context, state) {
          final type = state.uri.queryParameters['type'] ?? 'phone';
          return CompleteProfileScreen(loginType: type);
        },
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home Screen')),
    );
  }
}
