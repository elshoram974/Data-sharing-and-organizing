import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../features/new_group/presentation/screens/add_group_details_screen.dart';
import '../../../../../features/new_group/presentation/screens/add_members_screen.dart';
import '../my_custom_transition.dart';

abstract final class NewGroupRoutes {
  const NewGroupRoutes();

  static const String addMembers = '/addMembers';
  static const String _addGroupDetails = 'addGroupDetails';
  static const String addGroupDetails = '$addMembers/$_addGroupDetails';

  static GoRoute call() {
    return GoRoute(
      path: addMembers,
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
        offset: const Offset(0, -1),
        context: context,
        state: state,
        child: const AddMembersScreen(),
      ),
      routes: [
        GoRoute(
          path: _addGroupDetails,
          pageBuilder: (context, state) => MyCustomTransition.slideTransition(
            offset: const Offset(-1, 0),
            context: context,
            state: state,
            child: const AddGroupDetailsScreen(),
          ),
        )
      ],
    );
  }
}
