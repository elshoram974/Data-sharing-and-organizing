import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../features/chat/presentation/screens/group_details_screen.dart';
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
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: GroupDetailsScreen(group: state.extra as GroupHomeEntity),
          ),
        )
      ],
    );
  }
}
