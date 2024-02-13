import 'package:flutter/material.dart';

import '../../domain/entities/group_home_entity.dart';
import '../widgets/main_screen_widgets/main_body.dart';
import '../widgets/notification_widgets/notification_tile_widget.dart';

class UserNotificationScreen extends StatelessWidget {
  const UserNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBodyWidget(
      children: [
        NotificationTile(
          groupHomeEntity: GroupHomeEntity(
            imageLink:
                'https://images.justwatch.com/poster/248497985/s592/one-piece',
            groupName: 'First year in THIET aa aa a a a a a a a a a a a a',
            lastMessage:
                'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
            unReadCounter: 1,
            isUnread: true,
            lastMessageTime: DateTime.now(),
          ),
        ),
        NotificationTile(
          groupHomeEntity: GroupHomeEntity(
            imageLink:
                'https://images.justwatch.com/poster/248497985/s592/one-piece',
            groupName: 'First year in THIET',
            lastMessage:
                'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
            lastMessageTime: DateTime.now(),
          ),
        ),
      ],
    );
  }
}