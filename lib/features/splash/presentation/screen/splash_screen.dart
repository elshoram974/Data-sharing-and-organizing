import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/config_cubit.dart';
import '../widgets/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.config = BlocProvider.of<ConfigCubit>(context);
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
