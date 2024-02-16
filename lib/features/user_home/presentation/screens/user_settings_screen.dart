import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../widgets/settings/dark_mode_list_tile.dart';
import '../widgets/settings/locale_tile/language_list_tile.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context).textTheme.titleLarge;
    final Color? color = style?.color;
    final double h = MediaQuery.sizeOf(context).height;

    return EmptyScreenWithTitle(
      title: S.of(context).settings,
      children: [
        SizedBox(height: h * 0.08),
        LanguageListTile(color: color, style: style),
        SizedBox(height: h * 0.05),
        DarkModeListTile(color: color, style: style),
        SizedBox(height: h * 0.06),
      ],
    );
  }
}
