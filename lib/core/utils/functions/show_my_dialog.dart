import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/dialog/custom_dialog.dart';
import '../config/locale/generated/l10n.dart';
import '../config/routes/routes.dart';

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

  static Future<T?> error<T>(
    BuildContext context, {
    required String body,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).error,
          body: body,
          textCancel: S.of(context).gotIt,
        );
      },
    );
  }

  static Future<bool?> back(BuildContext context, {String? body}) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).goBack,
          body: body ?? S.of(context).ifYouReturnNowYouWillLoseAllData,
          textCancel: S.of(context).goBack,
          onPressCancel: () {
            context.pop();
            context.pop();
          },
          textConfirm: S.of(context).stayHere,
          onPressConfirm: context.pop,
        );
      },
    );
  }

  static Future<T?> verifyDialog<T>() {
    return showDialog<T>(
      context: AppRoute.key.currentContext!,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).warning,
          body: 'u have to verify your account',
          textConfirm: 'verify it',
          onPressConfirm: () {
            AppRoute.key.currentContext?.pop();
            AppRoute.key.currentContext
                ?.push(AppRoute.codeVerification, extra: AppRoute.home);
          },
        );
      },
    );
  }
}
