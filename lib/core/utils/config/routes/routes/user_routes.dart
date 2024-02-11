import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:data_sharing_organizing/features/user_home/presentation/cubit/main_cubit/user_main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../features/user_home/presentation/screens/user_main_screen.dart';
import '../my_custom_transition.dart';

abstract final class UserRoutes {
  const UserRoutes();

  static const String userHome = '/home';

  static GoRoute call() {
    return GoRoute(
      path: userHome,
      pageBuilder: (context, state) => MyCustomTransition.slideTransition(
        offset: const Offset(0, -1),
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => UserMainCubit(state.extra as AuthUserEntity),
          child: const UserMainScreens(),
        ),
      ),
      routes: [],
    );
  }
}
