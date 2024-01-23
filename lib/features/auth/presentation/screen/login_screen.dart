import 'package:data_sharing_organizing/core/utils/functions/on_close_app.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit/login_cubit.dart';
import '../widgets/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.login = BlocProvider.of<LoginCubit>(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) closeApp(context);
      },
      child: const Scaffold(body: LoginBody()),
    );
  }
}
