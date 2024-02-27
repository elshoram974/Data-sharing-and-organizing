import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/group_notification_entity.dart';
import 'group_body/notification_group_image.dart';
import 'group_body/notification_tile_body.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.groupNotificationEntity,
    this.onPressExpanded,
    this.onTap,
  });

  final GroupNotificationEntity groupNotificationEntity;
  final void Function(bool)? onPressExpanded;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConst.borderRadius),
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: AppConst.defaultPadding,
          bottom: 7,
          top: 7,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: groupNotificationEntity.isUnread ? AppColor.primary : AppColor.gray),
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
        ),
        child: _GroupListTile(
          groupNotificationEntity: groupNotificationEntity,
          onPressExpanded: onPressExpanded,
        ),
      ),
    ).bottomPadding(25);
  }
}

class _GroupListTile extends StatelessWidget {
  const _GroupListTile({
    required this.groupNotificationEntity,
    required this.onPressExpanded,
  });

  final GroupNotificationEntity groupNotificationEntity;
  final void Function(bool p1)? onPressExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NotificationGroupImage(imageLink: groupNotificationEntity.imageLink),
        const SizedBox(width: 8),
        NotificationTileBody(
          onPressExpanded: onPressExpanded,
          groupNotificationEntity: groupNotificationEntity,
        ),
      ],
    );
  }
}
