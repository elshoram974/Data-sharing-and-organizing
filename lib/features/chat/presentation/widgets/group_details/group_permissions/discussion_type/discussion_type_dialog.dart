import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:flutter/material.dart';

import 'discussion_type_tile_in_dialog.dart';

class DiscussionTypeDialog extends StatelessWidget {
  const DiscussionTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResConstrainedBox(
      maxWidthNotPhone: AppConst.dialogConstraint,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DiscussionTypeTileInDialog(type: GroupDiscussionType.exist),
            DiscussionTypeTileInDialog(type: GroupDiscussionType.notExist),
            DiscussionTypeTileInDialog(type: GroupDiscussionType.existButClosed),
          ],
        ),
      ),
    );
  }
}
