import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/features/auth/data/models/app_user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/request_to_send_code_use_case.dart';
import '../../domain/usecases/verify_code_use_case.dart';
import '../cubit/verify_code_cubit/verify_code_cubit.dart';
import '../widgets/code_verification/code_verification_body.dart';

class CodeVerificationScreen extends StatelessWidget {
  final String nextRoute;
  final User user;
  const CodeVerificationScreen({
    required this.user,
    required this.nextRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCodeCubit(
        user: user,
        nextRoute: nextRoute,
        sendCodeUseCase: sl.get<RequestToSendCodeUseCase>(),
        verifyCodeUseCase: sl.get<VerifyCodeUseCase>(),
      ),
      child: const Scaffold(body: CodeVerificationBody()),
    );
  }
}
