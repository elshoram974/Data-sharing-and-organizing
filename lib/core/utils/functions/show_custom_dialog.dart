import 'package:flutter/material.dart';

import '../../shared/dialog/custom_dialog.dart';
import '../config/locale/generated/l10n.dart';

abstract final class ShowCustomDialog {
  const ShowCustomDialog();

  static Future<T?> warning<T>(
    BuildContext context, {
    required String body,
    TextAlign? bodyAlign,
    String? textConfirm,
    String? textCancel,
    void Function()? onPressConfirm,
    void Function()? onPressCancel,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return CustomDialog(
          textConfirm: textConfirm,
          textCancel: textCancel,
          onPressCancel: onPressCancel,
          onPressConfirm: onPressConfirm,
          title: S.of(context).warning,
          crossAxisAlignment: CrossAxisAlignment.center,
          body: body,
          bodyAlign: bodyAlign,
        );
      },
    );
  }

  static Future<T?> error<T>(
    BuildContext context, {
    required String body,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).error,
          crossAxisAlignment: CrossAxisAlignment.center,
          body: body,
          textCancel: S.of(context).gotIt,
        );
      },
    );
  }
}
