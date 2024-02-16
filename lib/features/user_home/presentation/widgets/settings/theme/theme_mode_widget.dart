import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../settings_tile_widget.dart';
import 'theme_mode_dialog.dart';
import 'theme_mode_name_arrow.dart';

class ThemeModeWidget extends StatelessWidget {
  const ThemeModeWidget({
    super.key,
    required this.color,
    required this.style,
  });

  final Color? color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBoxAlign(
      child: SettingsTileWidget(
        color: color,
        style: style,
        icon: Icons.dark_mode_outlined,
        title: S.of(context).themeMode,
        onTap: () => showThemeModeDialog(context),
        trailing: const ThemeModeNameAndArrow(),
      ),
    );
  }

  void showThemeModeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          clipBehavior: Clip.hardEdge,
          child: ThemeModesDialog(),
        );
      },
    );
  }
}
