import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/request_to_send_code_use_case.dart';
import '../../domain/usecases/verify_code_use_case.dart';
import '../cubit/verify_code_cubit/verify_code_cubit.dart';
import '../widgets/code_verification/code_verification_body.dart';

class CodeVerificationScreen extends StatelessWidget {
  final String nextRoute;
  final int userId;
  const CodeVerificationScreen({required this.userId, required this.nextRoute, super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCodeCubit(
    userId:userId ,
    sendCodeUseCase: sl.get<RequestToSendCodeUseCase>() ,
    verifyCodeUseCase: sl.get<VerifyCodeUseCase>(),
  ),
      child: Scaffold(body: CodeVerificationBody(nextRoute)),
    );
  }
}
