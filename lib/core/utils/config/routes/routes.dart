import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/splash/presentation/screen/splash_screen.dart';
import 'routes/authentication_routes.dart';
import 'routes/user_home_routes.dart';

abstract class AppRoute {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static const String splashScreen = '/';

  // * authorization screens *//
  static const String login = AuthRoutes.login;
  static const String authSettings = AuthRoutes.authSettings;
  static const String recover = AuthRoutes.recover;
  static const String forgotPassword = AuthRoutes.forgotPassword;
  static const String codeVerification = AuthRoutes.codeVerification;
  static const String signUp = AuthRoutes.signUp;
  // * ------ End authorization screens ------ *//

  // * user screens *//
  static const String userHome = UserHomeRoutes.userHome;
  // * ------ End user screens ------ *//

  static final GoRouter router = GoRouter(
    navigatorKey: key,
    routes: <RouteBase>[
      GoRoute(
        path: splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      AuthRoutes.call(),
      UserHomeRoutes.call(),
    ],
  );
}
