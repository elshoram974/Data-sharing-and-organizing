import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../features/auth/presentation/screen/login_screen.dart';
import '../../../../../features/auth/presentation/screen/recover_screen.dart';
import '../../../../../features/auth/presentation/screen/settings_auth_screen.dart';
import '../my_custom_transition.dart';

abstract final class AuthRoutes {
  const AuthRoutes();

  static const String loginScreen = '/loginScreen';

  static const String _authSettingsScreen = 'authSettingsScreen';
  static const String authSettingsScreen = '$loginScreen/$_authSettingsScreen';

  static const String _recoverScreen = 'recoverScreen';
  static const String recoverScreen = '$loginScreen/$_recoverScreen';

  static GoRoute call() {
    return GoRoute(
      path: loginScreen,
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
        offset: const Offset(0, -1),
        context: context,
        state: state,
        child: const LoginScreen(),
      ),
      routes: [
        GoRoute(
          path: _authSettingsScreen,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const AuthSettingsScreen(),
          ),
        ),
        GoRoute(
          path: _recoverScreen,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const RecoverScreen(),
          ),
        ),
      ],
    );
  }
}