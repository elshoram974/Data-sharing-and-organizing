import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/login_cubit/login_cubit.dart';
import '../../auth_filled_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (p, c) => c is! ChangeRememberMeState,
      builder: (context, state) {
        return AuthFilledButton(
          text: S.of(context).login,
          onPressed: state is LoginLoadingState
              ? null
              : ProviderDependency.login.login,
        );
      },
    );
  }
}