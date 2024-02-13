import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../features/user_home/presentation/screens/main_screen/user_main_screen.dart';
import '../../../../../features/user_home/presentation/screens/user_notifications_settings_screen.dart';
import '../my_custom_transition.dart';

abstract final class UserRoutes {
  const UserRoutes();

  static const String userHome = '/home';

  static const String _notificationsSettings = 'notificationsSettings';
  static const String notificationsSettings = '$userHome/$_notificationsSettings';

  static GoRoute call() {
    return GoRoute(
      path: userHome,
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
        )
      ],
    );
  }
}
