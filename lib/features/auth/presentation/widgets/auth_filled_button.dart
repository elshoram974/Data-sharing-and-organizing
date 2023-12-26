import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit/login_cubit.dart';

class AuthFilledButton extends StatelessWidget {
  const AuthFilledButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (p, c) => c is! ChangeRememberMeState,
      builder: (context, state) {
        return FilledButton(
          onPressed: state is LoginLoadingState ? null : onPressed,
          style: FilledButton.styleFrom(
            minimumSize: const Size(100, 48),
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConst.borderRadius),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        );
      },
    ).verticalPadding(22);
  }
}
