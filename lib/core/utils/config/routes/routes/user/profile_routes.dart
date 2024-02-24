import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../features/user_home/presentation/screens/user_change_pass_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_edit_profile_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_groups_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_profile_screen.dart';
import '../../my_custom_transition.dart';
import 'user_routes.dart';

abstract final class ProfileRoutes {
  const ProfileRoutes();
  static const String _userProfile = 'userProfile';
  static const String userProfile = '${UserRoutes.userHome}/$_userProfile';

  static const String _userChangePassword = 'userChangePassword';
  static const String userChangePassword = '$userProfile/$_userChangePassword';

  static const String _userEditProfile = 'userEditProfile';
  static const String userEditProfile = '$userProfile/$_userEditProfile';

  static const String _userGroups = 'userGroups';
  static const String userGroups = '$userProfile/$_userGroups';

  static GoRoute call() {
    return GoRoute(
      path: _userProfile,
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
        offset: const Offset(-1, 0),
        context: context,
        state: state,
        child: const UserProfileScreen(),
      ),
      routes: [
        GoRoute(
          path: _userEditProfile,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const UserEditProfileScreen(),
          ),
        ),
        GoRoute(
          path: _userChangePassword,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const UserChangePassScreen(),
          ),
        ),
        GoRoute(
          path: _userGroups,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const UserGroupsScreen(),
          ),
        ),
      ],
    );
  }
}
