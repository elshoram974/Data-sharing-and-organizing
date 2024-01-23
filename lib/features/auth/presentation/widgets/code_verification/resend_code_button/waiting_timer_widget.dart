import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/verify_code_cubit/verify_code_cubit.dart';

class WaitingTimerWidget extends StatelessWidget {
  const WaitingTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyCodeCubit cubit = ProviderDependency.verificationCode;

    return BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
      buildWhen: (p, c) => c is VerifyCodeLoadingResendCodeState,
      builder: (context, state) {
        return Visibility(
          visible: cubit.waitingTime != 0,
          child: Text(
            displayTime(cubit.waitingTime),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  String displayTime(int allSeconds) {
    final int minutes = allSeconds ~/ 60; // Get minutes
    final int seconds = allSeconds % 60; // Get remaining seconds

    return '0$minutes:${seconds < 10 ? '0' : ''}$seconds'; // Format as MM:SS
  }
}
