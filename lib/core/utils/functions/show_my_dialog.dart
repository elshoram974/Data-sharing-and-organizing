import 'package:data_sharing_organizing/features/auth/data/models/app_user/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/widgets/settings/locale_tile/languages_dialog_list.dart';
import '../../shared/dialog/custom_dialog.dart';
import '../config/locale/generated/l10n.dart';
import '../config/routes/routes.dart';

abstract final class ShowMyDialog {
  const ShowMyDialog();

  static void showLangDialog(BuildContext context) {
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

  static Future<bool?> back(
    BuildContext context, {
    String? body,
    void Function()? onGoBack,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).goBack,
          body: body ?? S.of(context).areYouSureYouWantToReturnBack,
          crossAxisAlignment: CrossAxisAlignment.center,
          textCancel: S.of(context).goBack,
          onPressCancel: () {
            if (onGoBack != null) onGoBack();
            context.pop();
            context.pop();
          },
          textConfirm: S.of(context).stayHere,
          onPressConfirm: context.pop,
        );
      },
    );
  }

  static Future<T?> verifyDialog<T>(
    User user, [
    String nextRoute = AppRoute.userHome,
  ]) {
    return showDialog<T>(
      context: AppRoute.key.currentContext!,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).warning,
          body: S.of(context).uHaveToVerifyAccountFirst,
          crossAxisAlignment: CrossAxisAlignment.center,
          textConfirm: S.of(context).verifyIt,
          onPressConfirm: () {
            AppRoute.key.currentContext?.pop();
            AppRoute.key.currentContext?.push(
              AppRoute.codeVerification,
              extra: {'user': user, 'nextRoute': nextRoute},
            );
          },
        );
      },
    );
  }
}
