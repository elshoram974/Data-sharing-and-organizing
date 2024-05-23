import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../features/chat/presentation/screens/group_details_screen.dart';
import '../../../../../../features/chat/presentation/screens/group_media_docs_screen.dart';
import '../../../../../../features/chat/presentation/screens/group_permissions_screen.dart';
import '../../../../../../features/user_home/domain/entities/group_home_entity.dart';
import '../../../../../../features/chat/presentation/screens/group_screen.dart';
import '../../my_custom_transition.dart';
import 'user_routes.dart';

abstract final class GroupRoutes {
  const GroupRoutes();
  static const String _group = 'group';
  static const String group = '${UserRoutes.userHome}/$_group';

  static const String _groupDetails = 'groupDetails';
  static const String groupDetails = '$group/$_groupDetails';

  static const String _groupPermissions = 'groupPermissions';
  static const String groupPermissions = '$group/$_groupPermissions';

  static const String _groupMedia = 'groupMedia';
  static const String groupMedia = '$group/$_groupMedia';

  static GoRoute call() {
    return GoRoute(
      path: _group,
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
        offset: const Offset(-1, 0),
        context: context,
        state: state,
        child: UserGroupScreen(group: state.extra as GroupHomeEntity),
      ),
      routes: [
        GoRoute(
          path: _groupDetails,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(0, -1),
            context: context,
            state: state,
            child: GroupDetailsScreen(group: state.extra as GroupHomeEntity),
          ),
        ),
        GoRoute(
          path: _groupPermissions,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const GroupPermissionsScreen(),
          ),
        ),
        GoRoute(
          path: _groupMedia,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: GroupMediaDocsScreen(state.extra as List<Message>),
          ),
        ),
      ],
    );
  }
}
