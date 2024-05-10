import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:flutter/material.dart';

import '../../../../../user_home/domain/entities/group_home_entity.dart';
import 'discussion_type_tile_in_dialog.dart';

class DiscussionTypeDialog extends StatelessWidget {
  const DiscussionTypeDialog(
      {super.key, required this.group, required this.onSelect});
  final GroupHomeEntity group;
  final void Function(GroupDiscussionType) onSelect;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBox(
      maxWidthNotPhone: AppConst.dialogConstraint,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DiscussionTypeTileInDialog(
              type: GroupDiscussionType.exist,
              value: group.discussion,
              onSelect: () => onSelect(GroupDiscussionType.exist),
            ),
            DiscussionTypeTileInDialog(
              type: GroupDiscussionType.notExist,
              value: group.discussion,
              onSelect: () => onSelect(GroupDiscussionType.notExist),
            ),
            DiscussionTypeTileInDialog(
              type: GroupDiscussionType.existButClosed,
              value: group.discussion,
              onSelect: () => onSelect(GroupDiscussionType.existButClosed),
            ),
          ],
        ),
      ),
    );
  }
}
