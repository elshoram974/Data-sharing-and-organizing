import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../settings_tile_widget.dart';
import 'font_size_dialog.dart';
import 'font_size_name_arrow.dart';

class FontSizeWidget extends StatelessWidget {
  const FontSizeWidget({
    super.key,
    required this.color,
    required this.style,
  });

  final Color color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SettingsTileWidget<String>(
      color: color,
      style: style,
      icon: AppAssets.fontSizeIcon,
      title: S.of(context).fontSize,
      onTap: () => showThemeModeDialog(context),
      trailing: const FontSizeNameAndArrow(),
    );
  }

  void showThemeModeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          clipBehavior: Clip.hardEdge,
          child: FontSizeDialog(),
        );
      },
    );
  }
}
