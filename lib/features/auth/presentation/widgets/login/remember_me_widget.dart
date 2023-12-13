import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({super.key});

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool rememberMe = true;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(S.of(context).rememberMe, style: AppStyle.styleRegular15),
      contentPadding: EdgeInsets.zero,
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      visualDensity: VisualDensity.compact,
      value: rememberMe,
      onChanged: (val) {
        rememberMe = !rememberMe;
        setState(() {});
      },
    );
  }
}
