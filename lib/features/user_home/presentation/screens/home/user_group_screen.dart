import 'package:flutter/material.dart';

import '../../../domain/entities/group_home_entity.dart';
import '../../widgets/main_screen_widgets/main_body.dart';

class UserGroupScreen extends StatelessWidget {
  const UserGroupScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return MainBodyWidget(
      children: [
        Text(group.groupName),
      ],
    );
  }
}
