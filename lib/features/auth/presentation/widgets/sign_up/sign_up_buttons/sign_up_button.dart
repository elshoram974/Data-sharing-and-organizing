import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../auth_filled_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (p, c) => c is! ChooseUserRoleState,
      builder: (context, state) {
        return AuthFilledButton(
          text: S.of(context).signUp,
          onPressed: state is SignUpLoadingState
              ? null
              : ProviderDependency.signUp.signUp,
        );
      },
    );
  }
}
