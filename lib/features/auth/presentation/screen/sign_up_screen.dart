import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/sign_up_use_case.dart';
import '../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../widgets/sign_up/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(sl.get<SignUpUseCase>()),
      child: const Scaffold(body: SignUpBody()),
    );
  }
}
