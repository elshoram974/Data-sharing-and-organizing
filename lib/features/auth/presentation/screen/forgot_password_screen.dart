import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/new_password_use_case.dart';
import '../cubit/forgot_password_cubit/forgot_password_cubit.dart';
import '../widgets/forgot_password/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewPasswordCubit(
        userId: userId,
        createNewPasswordUseCase: sl.get<NewPasswordUseCase>(),
      ),
      child: const Scaffold(body: ForgotPasswordBody()),
    );
  }
}
