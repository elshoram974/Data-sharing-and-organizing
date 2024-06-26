import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/splash/presentation/screen/splash_screen.dart';
import 'routes/authentication_routes.dart';
import 'routes/new_group_routes.dart';
import 'routes/user/user_routes.dart';

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
  static const String userHome = UserRoutes.userHome;
  static const String userNotificationsSettings =
      UserRoutes.notificationsSettings;
  static const String userSettings = UserRoutes.userSettings;
  static const String userProfile = UserRoutes.userProfile;
  static const String userEditProfile = UserRoutes.userEditProfile;
  static const String userChangePassword = UserRoutes.userChangePassword;
  static const String userChangeName = UserRoutes.userChangeName;
  static const String userMyGroups = UserRoutes.userMyGroups;
  static const String deleteAccount = UserRoutes.deleteAccount;
  static const String group = UserRoutes.group;
  static const String groupDetails = UserRoutes.groupDetails;
  static const String groupPermissions = UserRoutes.groupPermissions;
  static const String groupMedia = UserRoutes.groupMedia;
  // * ------ End user screens ------ *//

  // * new group screens *//
  static const String addMembers = NewGroupRoutes.addMembers;
  static const String addGroupDetails = NewGroupRoutes.addGroupDetails;
  static const String addGroupPermissions = NewGroupRoutes.addGroupPermissions;
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
      UserRoutes.call(),
      NewGroupRoutes.call(),
    ],
  );
}
