import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/group_home_entity.dart';
import '../home_widgets/home_group_tile_widget/home_group_last_message.dart';

class NotificationSubtitle extends StatelessWidget {
  const NotificationSubtitle({super.key, required this.groupHomeEntity});

  final GroupHomeEntity groupHomeEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeGroupLastMessage(lastMessage: groupHomeEntity.lastMessage!),
        const SizedBox(width: AppConst.defaultPadding),
        Icon(
          Icons.keyboard_arrow_down,
          size: 32,
          color: groupHomeEntity.isUnread
              ? AppColor.active
              : AppColor.gray, //TODO: change the AppColor.gray value
        ),
      ],
    );
  }
}

