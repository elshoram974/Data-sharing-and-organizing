import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/group_notification_entity.dart';
import '../../home_widgets/home_group_tile_widget/group_body/home_group_last_message.dart';

class NotificationSubtitle extends StatelessWidget {
  const NotificationSubtitle({
    super.key,
    required this.groupNotificationEntity,
    this.onPressExpanded,
  });

  final GroupNotificationEntity groupNotificationEntity;
  final void Function(bool)? onPressExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: groupNotificationEntity.isExpanded
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.center,
      children: [
        HomeGroupLastMessage(
          maxLines: groupNotificationEntity.isExpanded ? 500 : 1,
          lastMessage: groupNotificationEntity.lastMessage!,
          lastMessageFrom: groupNotificationEntity.lastMessageFrom,
          lastMessageType: groupNotificationEntity.lastMessageType,
        ),
        ExpandIcon(
          isExpanded: groupNotificationEntity.isExpanded,
          size: 32,
          padding: EdgeInsets.zero,
          color: groupNotificationEntity.isUnread
              ? AppColor.active
              : AppColor.gray,
          onPressed: onPressExpanded,
        ),
      ],
    );
  }
}
