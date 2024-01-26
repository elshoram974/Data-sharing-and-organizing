import 'package:data_sharing_organizing/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../features/auth/presentation/screen/code_verification_screen.dart';
import '../../../../../features/auth/presentation/screen/forgot_password_screen.dart';
import '../../../../../features/auth/presentation/screen/login_screen.dart';
import '../../../../../features/auth/presentation/screen/recover_screen.dart';
import '../../../../../features/auth/presentation/screen/settings_auth_screen.dart';
import '../my_custom_transition.dart';

abstract final class AuthRoutes {
  const AuthRoutes();

  static const String login = '/loginScreen';

  static const String _authSettings = 'authSettings';
  static const String authSettings = '$login/$_authSettings';

  static const String _recover = 'recover';
  static const String recover = '$login/$_recover';

  static const String _forgotPassword = 'forgotPassword';
  static const String forgotPassword = '$login/$_forgotPassword';

  static const String _codeVerification = 'codeVerification';
  static const String codeVerification = '$login/$_codeVerification';

  static const String _signUp = 'signUp';
  static const String signUp = '$login/$_signUp';

  static GoRoute call() {
    return GoRoute(
      path: login,
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
        offset: const Offset(0, -1),
        context: context,
        state: state,
        child: const LoginScreen(),
      ),
      routes: [
        GoRoute(
          path: _authSettings,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: AuthSettingsScreen(previousRouteName: state.extra as String),
          ),
        ),
        GoRoute(
          path: _recover,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const RecoverScreen(),
          ),
        ),
        GoRoute(
          path: _forgotPassword,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: ForgotPasswordScreen(userId: state.extra as int),
          ),
        ),
        GoRoute(
            path: _codeVerification,
            pageBuilder: (context, state) {
              Map<String, dynamic> data = state.extra as Map<String, dynamic>;
              return MyCustomTransition.slideTransition(
                offset: const Offset(-1, 0),
                context: context,
                state: state,
                child: CodeVerificationScreen(
                  user: data['user'],
                  nextRoute: data['nextRoute'],
                ),
              );
            }),
        GoRoute(
          path: _signUp,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const SignUpScreen(),
          ),
        ),
      ],
    );
  }
}
