import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:flutter/material.dart';

import 'lang_name_and_arrow.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({super.key, required this.color, required this.style});

  final Color? color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.language),
      iconColor: color,
      title: Text(S.of(context).language, style: style),
      trailing: const LangNameAndArrow(),
      onTap: () => ShowMyDialog.showLangDialog(context),
    );
  }
}
