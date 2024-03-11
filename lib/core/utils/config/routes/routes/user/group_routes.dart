import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../features/user_home/domain/entities/group_home_entity.dart';
import '../../../../../../features/user_home/presentation/screens/home/user_group_screen.dart';
import '../../my_custom_transition.dart';
import 'user_routes.dart';

abstract final class GroupRoutes {
  const GroupRoutes();
  static const String _group = 'group';
  static const String group = '${UserRoutes.userHome}/$_group';

  static GoRoute call() {
    return GoRoute(
      path: _group,
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
        offset: const Offset(-1, 0),
        context: context,
        state: state,
        child: UserGroupScreen(group: state.extra as GroupHomeEntity),
      ),
      routes: const [],
    );
  }
}
