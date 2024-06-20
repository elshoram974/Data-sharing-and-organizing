import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:flutter/material.dart';

import '../../../../features/user_home/presentation/widgets/menu_widgets/settings/settings_tile_widget.dart';
import '../name_and_arrow_in_tile.dart';
import 'access_type_dialog.dart';

class AccessTypeWidget extends StatelessWidget {
  const AccessTypeWidget({
    super.key,
    required this.accessType,
    required this.color,
    required this.style,
    required this.onSelect,
  });

  final Color color;
  final TextStyle? style;
  final GroupAccessType accessType;
  final void Function(GroupAccessType) onSelect;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBoxAlign(
      child: SettingsTileWidget<String>(
        color: color,
        style: style,
        icon: AppAssets.groupOpenAccess,
        title: S.of(context).groupAccessType,
        onTap: () => showAccessTypeDialog(context, accessType),
        trailing: NameAndArrowInTile(accessType.typeName(context)),
      ),
    );
  }

  void showAccessTypeDialog(BuildContext context, GroupAccessType accessType) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          child: AccessTypeDialog(
            value: accessType,
            onSelect: onSelect,
          ),
        );
      },
    );
  }
}
