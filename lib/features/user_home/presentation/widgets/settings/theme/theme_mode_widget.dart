import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/responsive_ex.dart';
import 'package:flutter/material.dart';

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
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
        shape: context.isPhoneWidth
            ? const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConst.borderRadius)),
        leading: Icon(Icons.dark_mode_outlined, color: color),
        iconColor: color,
        title: Text(S.of(context).themeMode, style: style),
        trailing: const ThemeModeNameAndArrow(),
        onTap: () => showThemeModeDialog(context),
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
