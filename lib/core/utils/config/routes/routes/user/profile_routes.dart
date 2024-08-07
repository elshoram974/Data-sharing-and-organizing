import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../features/user_home/presentation/screens/user_menu_screen/user_profile_screen/delete_account_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_menu_screen/user_profile_screen/user_change_name_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_menu_screen/user_profile_screen/user_change_pass_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_menu_screen/user_profile_screen/user_edit_profile_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_menu_screen/user_profile_screen/user_my_groups_screen.dart';
import '../../../../../../features/user_home/presentation/screens/user_menu_screen/user_profile_screen/user_profile_screen.dart';
import '../../../../functions/on_close_app.dart';
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

  static const String _userMyGroups = 'userGroups';
  static const String userMyGroups = '$userProfile/$_userMyGroups';

  static const String _deleteAccount = 'deleteAccount';
  static const String deleteAccount = '$userProfile/$_deleteAccount';

  static const String _userChangeName = 'userChangeName';
  static const String userChangeName = '$userProfile/$_userChangeName';

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
          path: _userMyGroups,
          onExit: (context,_) => onCloseApp(
            context: context,
            canGoTo: [],
            currentRoute: userMyGroups,
          ),
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const UserMyGroupsScreen(),
          ),
        ),
        GoRoute(
          path: _deleteAccount,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const DeleteAccountScreen(),
          ),
        ),
        GoRoute(
          path: _userChangeName,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const UserChangeNameScreen(),
          ),
        ),
      ],
    );
  }
}
