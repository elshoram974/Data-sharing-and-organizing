import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../features/auth/domain/entities/auth_user_entity.dart';
import '../../../../../../features/user_home/presentation/screens/main_screen/user_main_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_menu_screen/user_notifications_settings_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_menu_screen/user_settings_screen.dart';
import '../../../../functions/on_close_app.dart';
import '../../my_custom_transition.dart';
import '../../routes.dart';
import 'group_routes.dart';
import 'profile_routes.dart';

abstract final class UserRoutes {
  const UserRoutes();

  static const String userHome = '/home';

  static const String _notificationsSettings = 'notificationsSettings';
  static const String notificationsSettings =
      '$userHome/$_notificationsSettings';

  static const String _userSettings = 'userSettings';
  static const String userSettings = '$userHome/$_userSettings';

  // * profile screens *//
  static const String userProfile = ProfileRoutes.userProfile;
  static const String userEditProfile = ProfileRoutes.userEditProfile;
  static const String userChangePassword = ProfileRoutes.userChangePassword;
  static const String userChangeName = ProfileRoutes.userChangeName;
  static const String userMyGroups = ProfileRoutes.userMyGroups;
  static const String deleteAccount = ProfileRoutes.deleteAccount;
  // * ------ End profile screens ------ *//

  // * group screens *//
  static const String group = GroupRoutes.group;
  static const String groupDetails = GroupRoutes.groupDetails;
  // * ------ End group screens ------ *//

  static GoRoute call() {
    return GoRoute(
      path: userHome,
      onExit: (_) => onCloseApp(
        context: _,
        canGoTo: [AppRoute.login],
        currentRoute: userHome,
      ),
      redirect: (context, state) {
        if (state.extra == null && state.fullPath == userHome) return '/';
        // TODO: Make redirect to other screens
        return null;
      },
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
          offset: const Offset(0, -1),
          context: context,
          state: state,
          child: UserMainScreens(state.extra as AuthUserEntity)),
      routes: [
        GoRoute(
          path: _notificationsSettings,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const UserNotificationsSettingsScreen(),
          ),
        ),
        GoRoute(
          path: _userSettings,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const UserSettingsScreen(),
          ),
        ),
        ProfileRoutes.call(),
        GroupRoutes.call(),
      ],
    );
  }
}
