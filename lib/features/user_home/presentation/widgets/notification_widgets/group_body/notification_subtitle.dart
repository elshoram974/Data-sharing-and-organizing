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
        if (groupNotificationEntity.lastActivity != null)
          HomeGroupLastMessage(
            maxLines: groupNotificationEntity.isExpanded ? 500 : 1,
            lastMessage: groupNotificationEntity.lastActivity!.content,
            lastMessageFrom: groupNotificationEntity.lastActivity!.createdBy.user.name,
            lastMessageType: groupNotificationEntity.lastActivity!.type,
          ),
        ExpandIcon(
          isExpanded: groupNotificationEntity.isExpanded,
          size: 32,
          padding: EdgeInsets.zero,
          color: groupNotificationEntity.unReadCounter != null
              ? AppColor.active
              : AppColor.gray,
          onPressed: onPressExpanded,
        ),
      ],
    );
  }
}
