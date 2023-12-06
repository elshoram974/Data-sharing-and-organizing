import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'lang_name_and_arrow.dart';
import 'languages_dialog_list.dart';

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
      onTap: () => showLangDialog(context),
    );
  }

  void showLangDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          clipBehavior: Clip.hardEdge,
          child: LanguagesDialogList(),
        );
      },
    );
  }
}
