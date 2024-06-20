import 'package:data_sharing_organizing/core/shared/responsive/in_many_device.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../auth/domain/usecases/log_out_use_case.dart';
import '../../cubit/main_cubit/user_main_cubit.dart';
import '../../cubit/user_home_cubit/user_home_cubit.dart';
import 'res/desktop_main_screen.dart';
import 'res/phone_main_screen.dart';
import 'res/tablet_main_screen.dart';

class UserMainScreens extends StatelessWidget {
  const UserMainScreens(this.user, {super.key});
  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserMainCubit(
            user: user,
            logOutUseCase: sl.get<LogOutUseCase>(),
          ),
        ),
        BlocProvider(create: (context) => sl.get<UserHomeCubit>(param1: false)),
      ],
      child: const _UserMainScreens(),
    );
  }
}

class _UserMainScreens extends StatelessWidget {
  const _UserMainScreens();

  @override
  Widget build(BuildContext context) {
    ProviderDependency.userMain = BlocProvider.of<UserMainCubit>(context);
    ProviderDependency.userHome = BlocProvider.of<UserHomeCubit>(context);

    return BlocBuilder<UserMainCubit, UserMainState>(
      buildWhen: (p, c) => c is UserMainChangeNavBar,
      builder: (context, state) {
        final int navIndex = ProviderDependency.userMain.navIndex;
        final AuthUserEntity user = ProviderDependency.userMain.user;

        return InManyDevice(
          phone: UserMainScreensInPhone(navIndex: navIndex, user: user),
          tablet: UserMainScreensInTablet(navIndex: navIndex, user: user),
          desktop: UserMainScreensInDesktop(navIndex: navIndex, user: user),
        );
      },
    );
  }
}

Builder? getHomeNav(int navIndex, AuthUserEntity user) {
  switch (navIndex) {
    case 0:
      return Builder(builder: (context) {
        return FloatingActionButton(
          backgroundColor: AppColor.active,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () => context.push(AppRoute.addMembers, extra: user),
        );
      });
  }
  return null;
}
