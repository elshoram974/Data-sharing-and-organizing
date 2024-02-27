import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
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
        HomeGroupLastMessage(lastMessage: groupHomeEntity.lastMessage!),
        const SizedBox(width: AppConst.defaultPadding),
        if (groupHomeEntity.isUnread)
          GroupUnreadCounter(unReadCounter: groupHomeEntity.unReadCounter),
      ],
    );
  }
}
