import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../widgets/settings/theme/theme_mode_widget.dart';
import '../widgets/settings/language_list_tile.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontFamily: AppStrings.inika);
    final Color? color = style?.color;

    const SizedBox space = SizedBox(height: 52);

    return EmptyScreenWithTitle(
      title: S.of(context).settings,
      children: [
        space,
        LanguageListTile(color: color, style: style),
        space,
        ThemeModeWidget(color: color, style: style),
        space,
      ],
    );
  }
}
