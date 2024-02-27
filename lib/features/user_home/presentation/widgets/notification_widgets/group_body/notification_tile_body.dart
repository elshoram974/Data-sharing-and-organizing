import 'package:flutter/material.dart';

import '../../../../domain/entities/group_notification_entity.dart';
import 'group_name_time_counter.dart';
import 'notification_subtitle.dart';

class NotificationTileBody extends StatelessWidget {
  const NotificationTileBody({
    super.key,
    required this.groupNotificationEntity,
    this.onPressExpanded,
  });

  final GroupNotificationEntity groupNotificationEntity;
  final void Function(bool)? onPressExpanded;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GroupNameAndTimeAndCounterTile(groupNotificationEntity: groupNotificationEntity),
          if (groupNotificationEntity.lastMessage != null)
            NotificationSubtitle(
              groupNotificationEntity: groupNotificationEntity,
              onPressExpanded: onPressExpanded,
            ),
        ],
      ),
    );
  }
}
