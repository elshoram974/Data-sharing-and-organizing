import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:flutter/material.dart';

import '../../../../../user_home/domain/entities/group_home_entity.dart';
import 'access_type_tile_in_dialog.dart';

class AccessTypeDialog extends StatelessWidget {
  const AccessTypeDialog({
    super.key,
    required this.group,
    required this.onSelect,
  });
  final GroupHomeEntity group;
  final void Function(GroupAccessType) onSelect;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBox(
      maxWidthNotPhone: AppConst.dialogConstraint,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AccessTypeTileInDialog(
              type: GroupAccessType.onlyRead,
              value: group.accessType,
              onSelect: () => onSelect(GroupAccessType.onlyRead),
            ),
            AccessTypeTileInDialog(
              type: GroupAccessType.readWrite,
              value: group.accessType,
              onSelect: () => onSelect(GroupAccessType.readWrite),
            ),
            AccessTypeTileInDialog(
              type: GroupAccessType.readWriteWithAdminPermission,
              value: group.accessType,
              onSelect: () =>
                  onSelect(GroupAccessType.readWriteWithAdminPermission),
            ),
          ],
        ),
      ),
    );
  }
}
