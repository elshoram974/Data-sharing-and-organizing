import 'package:flutter/material.dart';

import '../../shared/dialog/custom_dialog.dart';
import '../config/locale/generated/l10n.dart';

abstract final class ShowMyDialog {
  const ShowMyDialog();

  static Future<T?> warning<T>(
    BuildContext context, {
    required String body,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).warning,
          body: body,
          textCancel: S.of(context).gotIt,
        );
      },
    );
  }
}
