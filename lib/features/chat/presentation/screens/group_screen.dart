import 'package:flutter/material.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../../user_home/presentation/widgets/main_screen_widgets/main_body.dart';

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
