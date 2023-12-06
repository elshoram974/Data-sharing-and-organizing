import 'package:data_sharing_organizing/features/auth/presentation/screen/settings_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/presentation/screen/login_screen.dart';
import 'features/splash/presentation/screen/splash_screen.dart';

abstract class AppRoute {
  static const String splashScreen = '/';

  static const String loginScreen = '/loginScreen';

  static const String _authSettingsScreen = 'authSettingsScreen';
  static const String authSettingsScreen = '$loginScreen/$_authSettingsScreen';

  static const String homeScreen = '/homeScreen';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: loginScreen,
        pageBuilder: (context, state) => _buildPageWithDefaultTransition(
          offset: const Offset(0, -1),
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
        routes: [
          GoRoute(
            path: _authSettingsScreen,
            pageBuilder: (context, state) => _buildPageWithDefaultTransition(
              offset: const Offset(-1, 0),
              context: context,
              state: state,
              child: const AuthSettingsScreen(),
            ),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage _buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    required Offset offset,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: offset,
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.easeInOut),
          ),
        ),
        child: child,
      ),
    );
  }
}
