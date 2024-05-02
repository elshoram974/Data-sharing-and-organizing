import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../user_home/presentation/widgets/menu_widgets/settings/settings_tile_widget.dart';
import 'access_type_dialog.dart';
import 'access_type_name_arrow.dart';

class AccessTypeWidget extends StatelessWidget {
  const AccessTypeWidget({
    super.key,
    required this.color,
    required this.style,
  });

  final Color color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBoxAlign(
      child: SettingsTileWidget<String>(
        color: color,
        style: style,
        icon: AppAssets.groupOpenAccess,
        title: S.of(context).groupAccessType,
        onTap: () => showThemeModeDialog(context),
        trailing: const AccessTypeNameAndArrow(),
      ),
    );
  }

  void showThemeModeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          clipBehavior: Clip.hardEdge,
          child: AccessTypeDialog(),
        );
      },
    );
  }
}
