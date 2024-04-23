import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/functions/convert_date_to_string.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/group_notification_entity.dart';
import '../../home_widgets/home_group_tile_widget/group_body/group_unread_counter.dart';

class GroupNameAndTimeAndCounterTile extends StatelessWidget {
  const GroupNameAndTimeAndCounterTile({
    super.key,
    required this.groupNotificationEntity,
  });

  final GroupNotificationEntity groupNotificationEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  groupNotificationEntity.groupName,
                  style: AppStyle.styleBoldInika24.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(width: 8),
              if (groupNotificationEntity.unReadCounter != null) ...[
                GroupUnreadCounter(unReadCounter: groupNotificationEntity.unReadCounter),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
        
          Text(
            DateToString.call(
              groupNotificationEntity.lastActivity?.createdAt ?? groupNotificationEntity.memberEntity.joinDate,
              false,
            ),
            style: TextStyle(
              color: groupNotificationEntity.unReadCounter != null
                  ? AppColor.active
                  : AppColor.gray,
              fontSize: 10,
            ),
          ),
      ],
    );
  }
}
