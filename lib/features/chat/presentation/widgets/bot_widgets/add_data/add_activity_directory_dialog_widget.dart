import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddActivityOrDirectoryDialogWidget extends StatelessWidget {
  const AddActivityOrDirectoryDialogWidget({
    super.key,
    required this.content,
    required this.addButton,
  });

  final Widget content;
  final Widget addButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: content,
      actions: [
        addButton,
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).cancel),
        ),
      ],
    );
  }
}
