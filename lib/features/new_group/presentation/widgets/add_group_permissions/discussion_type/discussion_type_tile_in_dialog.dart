import 'package:data_sharing_organizing/core/shared/dialog/choose_dialog_tile.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiscussionTypeTileInDialog extends StatelessWidget {
  const DiscussionTypeTileInDialog({super.key, required this.type});

  final GroupDiscussionType type;

  @override
  Widget build(BuildContext context) {
    const cubitVal = GroupDiscussionType.exist;
    return ChooseDialogListTile<GroupDiscussionType>(
      title: type.typeName(context),
      value: cubitVal,
      groupValue: type,
      onTap: () => onTap(context),
    );
  }

  void onTap(BuildContext _) => {_.pop()}; // TODO:, cubit.changeMode(themeMode)
}
