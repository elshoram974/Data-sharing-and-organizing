import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/functions/convert_date_to_string.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/group_home_entity.dart';

class GroupNameAndTimeTile extends StatelessWidget {
  const GroupNameAndTimeTile({super.key, required this.groupHomeEntity});

  final GroupHomeEntity groupHomeEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            groupHomeEntity.groupName,
            style: AppStyle.styleBoldInika24.copyWith(fontSize: 16),
          ),
        ),
        if (groupHomeEntity.lastMessage != null)
          Text(
            DateToString.call(groupHomeEntity.lastMessageTime!, false),
            style: TextStyle(
              color: groupHomeEntity.unReadCounter != null ? AppColor.active : AppColor.gray,
              fontSize: 10,
            ),
          ),
      ],
    );
  }
}
