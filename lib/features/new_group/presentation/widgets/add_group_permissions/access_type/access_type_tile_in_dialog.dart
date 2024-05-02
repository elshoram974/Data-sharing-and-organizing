import 'package:data_sharing_organizing/core/shared/dialog/choose_dialog_tile.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccessTypeTileInDialog extends StatelessWidget {
  const AccessTypeTileInDialog({super.key, required this.type});

  final GroupAccessType type;

  @override
  Widget build(BuildContext context) {
    const cubitVal = GroupAccessType.readWriteWithAdminPermission;
    return ChooseDialogListTile<GroupAccessType>(
      title: type.typeName(context),
      value: cubitVal,
      groupValue: type,
      onTap: () => onTap(context),
    );
  }

  void onTap(BuildContext _) => {_.pop()}; // TODO:, cubit.changeMode(themeMode)
}
