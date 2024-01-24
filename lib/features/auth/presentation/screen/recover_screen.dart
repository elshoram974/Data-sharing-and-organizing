import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/recover_account_use_case.dart';
import '../cubit/recoverAccount_cubit/recover_account_cubit.dart';
import '../widgets/recover/recover_body.dart';

class RecoverScreen extends StatelessWidget {
  const RecoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecoverAccountCubit(sl.get<RequestToRecoverAccountUseCase>()),
      child: const Scaffold(body: RecoverBody()),
    );
  }
}
