import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../cubit/main_cubit/user_main_cubit.dart';
import '../widgets/main_screen_widgets/bottom_nav_bar.dart';
import '../widgets/main_screen_widgets/main_screen_body.dart';
import '../widgets/main_screen_widgets/main_user_app_bar.dart';

class UserMainScreens extends StatelessWidget {
  const UserMainScreens(this.user, {super.key});
  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserMainCubit(user),
      child: const _UserMainScreens(),
    );
  }
}

class _UserMainScreens extends StatelessWidget {
  const _UserMainScreens();

  @override
  Widget build(BuildContext context) {
    ProviderDependency.userMain = BlocProvider.of<UserMainCubit>(context);

    return BlocBuilder<UserMainCubit, UserMainState>(
      buildWhen: (p, c) => c is UserMainChangeNavBar,
      builder: (context, state) {
        final int navIndex = ProviderDependency.userMain.navIndex;
        return Scaffold(
          appBar: const MainUserAppBar(),
          bottomNavigationBar: BottomNavBar(navIndex: navIndex),
          floatingActionButton: getHomeNav(navIndex),
          body: const MainScreenBody(),
        );
      },
    );
  }
}

FloatingActionButton? getHomeNav(int navIndex) {
  switch (navIndex) {
    case 0:
      return FloatingActionButton(
        backgroundColor: AppColor.active,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {},
      );
  }
  return null;
}
