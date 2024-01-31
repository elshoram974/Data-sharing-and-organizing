import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../features/user_home/presentation/screens/user_home_screen.dart';
import '../my_custom_transition.dart';

abstract final class UserHomeRoutes {
  const UserHomeRoutes();

  static const String userHome = '/home';

  static GoRoute call() {
    return GoRoute(
      path: userHome,
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
        offset: const Offset(0, -1),
        context: context,
        state: state,
        child: UserHomeScreen(user: state.extra as AuthUserEntity),
      ),
      routes: [],
    );
  }
}
