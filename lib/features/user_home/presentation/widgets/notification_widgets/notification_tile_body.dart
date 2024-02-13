import 'package:flutter/material.dart';

import '../../../domain/entities/group_home_entity.dart';
import 'group_name_time_counter.dart';
import 'notification_subtitle.dart';

class NotificationTileBody extends StatelessWidget {
  const NotificationTileBody({super.key, required this.groupHomeEntity});

  final GroupHomeEntity groupHomeEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GroupNameAndTimeAndCounterTile(groupHomeEntity: groupHomeEntity),
          if (groupHomeEntity.lastMessage != null)
            NotificationSubtitle(groupHomeEntity: groupHomeEntity),
        ],
      ),
    );
  }
}