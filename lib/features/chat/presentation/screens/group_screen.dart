import 'package:flutter/material.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../widgets/group_app_bar.dart';

class UserGroupScreen extends StatelessWidget {
  const UserGroupScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GroupAppBar(group: group),
        ],
      ),
    );
  }
}
