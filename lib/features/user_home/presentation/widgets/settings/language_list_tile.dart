import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../auth/presentation/widgets/settings/locale_tile/lang_name_and_arrow.dart';
import 'settings_tile_widget.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({super.key, required this.color, required this.style});

  final Color color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SettingsTileWidget<IconData>(
      color: color,
      style: style,
      icon: Icons.language,
      title: S.of(context).language,
      onTap: () => ShowMyDialog.showLangDialog(context),
      trailing: const LangNameAndArrow(makeInikaFont: true),
    );
  }
}
