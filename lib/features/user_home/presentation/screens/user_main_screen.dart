import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/main_screens.dart';
import '../cubit/main_cubit/user_main_cubit.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/main_user_app_bar.dart';

class UserMainScreens extends StatelessWidget {
  const UserMainScreens({super.key});

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
          body: PageView(
            controller: ProviderDependency.userMain.navController,
            onPageChanged: (_) =>
                ProviderDependency.userMain.onNavChange(_, true),
            children: [
              for (MainScreens e in MainScreens.items) e.screen,
            ],
          ),
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
