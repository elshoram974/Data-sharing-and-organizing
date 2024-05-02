import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../user_home/presentation/widgets/menu_widgets/settings/settings_tile_widget.dart';
import 'discussion_type_dialog.dart';
import 'discussion_type_name_arrow.dart';

class DiscussionTypeWidget extends StatelessWidget {
  const DiscussionTypeWidget({
    super.key,
    required this.color,
    required this.style,
  });

  final Color color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBoxAlign(
      child: SettingsTileWidget<IconData>(
        color: color,
        style: style,
        icon: Icons.dark_mode_outlined,
        title: S.of(context).groupDiscussionType,
        onTap: () => showThemeModeDialog(context),
        trailing: const DiscussionTypeNameAndArrow(),
      ),
    );
  }

  void showThemeModeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          clipBehavior: Clip.hardEdge,
          child: DiscussionTypeDialog(),
        );
      },
    );
  }
}
