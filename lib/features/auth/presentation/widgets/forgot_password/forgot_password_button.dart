import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../auth_filled_button.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthFilledButton(
      text: S.of(context).save,
      onPressed: () {
        TextInput.finishAutofillContext();

        // save new password Fn
        context.go(AppRoute.home);
      },
    ).topPadding(70);
  }
}
