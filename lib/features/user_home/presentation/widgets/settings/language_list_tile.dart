import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/responsive_ex.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../auth/presentation/widgets/settings/locale_tile/lang_name_and_arrow.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({super.key, required this.color, required this.style});

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
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConst.borderRadius)),
        leading: const Icon(Icons.language),
        iconColor: color,
        title: Text(S.of(context).language, style: style),
        trailing: const LangNameAndArrow(makeInikaFont:true),
        onTap: () => ShowMyDialog.showLangDialog(context),
      ),
    );
  }
}
