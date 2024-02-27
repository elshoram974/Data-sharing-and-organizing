import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key, this.onSave});
  final void Function()? onSave;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onSave,
      style: TextButton.styleFrom(
        visualDensity: const VisualDensity(horizontal: 1),
        // padding: EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
        textStyle: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
      ),
      child: Text(S.of(context).save),
    );
  }
}
