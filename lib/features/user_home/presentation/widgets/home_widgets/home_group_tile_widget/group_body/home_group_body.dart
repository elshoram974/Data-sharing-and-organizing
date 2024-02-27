import 'package:flutter/material.dart';

import '../../../../../domain/entities/group_home_entity.dart';
import 'group_name_time_tile.dart';
import 'home_group_subtitle.dart';

class HomeGroupBody extends StatelessWidget {
  const HomeGroupBody({super.key, required this.groupHomeEntity});

  final GroupHomeEntity groupHomeEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GroupNameAndTimeTile(groupHomeEntity: groupHomeEntity),
          if (groupHomeEntity.lastMessage != null)
            HomeGroupSubtitle(groupHomeEntity: groupHomeEntity),
        ],
      ),
    );
  }
}