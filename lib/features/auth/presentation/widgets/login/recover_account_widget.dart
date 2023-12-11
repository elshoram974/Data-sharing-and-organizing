import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth_rich_button.dart';

class RecoverAccountButton extends StatelessWidget {
  const RecoverAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthRichButton(
      prefixText: S.of(context).forgetPassword,
      buttonText: S.of(context).recover,
      onTap: () => context.push(AppRoute.recoverScreen),
    );
  }
}
