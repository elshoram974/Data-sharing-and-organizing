import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/splash/presentation/screen/splash_screen.dart';
import 'routes/authentication_routes.dart';

abstract class AppRoute {
  static const String splashScreen = '/';

  // * authorization screens *//
  static const String loginScreen = AuthRoutes.loginScreen;
  static const String authSettingsScreen = AuthRoutes.authSettingsScreen;
  static const String recoverScreen = AuthRoutes.recoverScreen;
  // * ------ End authorization screens ------ *//

  static const String homeScreen = '/homeScreen';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      AuthRoutes.call(),
    ],
  );
}
