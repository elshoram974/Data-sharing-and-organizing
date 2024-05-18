import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/group_home_entity.dart';
import 'group_unread_counter.dart';
import 'home_group_last_message.dart';

class HomeGroupSubtitle extends StatelessWidget {
  const HomeGroupSubtitle({super.key, required this.groupHomeEntity});

  final GroupHomeEntity groupHomeEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (groupHomeEntity.lastActivity != null)
          HomeGroupLastMessage(lastActivity: groupHomeEntity.lastActivity!),
        const SizedBox(width: AppConst.defaultPadding),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (groupHomeEntity.memberEntity.notification ==
                NotificationEnum.withoutNotify) ...[
              const Icon(Icons.notifications_off_outlined,
                  color: AppColor.gray),
              const SizedBox(width: 0.5 * AppConst.defaultPadding)
            ],
            if (groupHomeEntity.unReadCounter != null)
              GroupUnreadCounter(unReadCounter: groupHomeEntity.unReadCounter),
          ],
        )
      ],
    );
  }
}
