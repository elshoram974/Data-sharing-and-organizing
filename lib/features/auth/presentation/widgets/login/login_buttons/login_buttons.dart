import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../auth_filled_button.dart';
import '../recover_account_widget.dart';
import '../remember_me_widget.dart';
import 'login_outlined_button.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const RecoverAccountButton(),
        const SizedBox(height: 25),
        const RememberMeWidget(),
        AuthFilledButton(
          text: S.of(context).login,
          onPressed: () {},
        ),
        LoginOutlinedButton(
          activeText: S.of(context).signUp,
          text: S.of(context).doNotHaveAnAccount,
          onPressed: () => context.push(AppRoute.signUpScreen),
        ),
      ],
    );
  }
}
