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
          body: MainScreens.items[navIndex].screen,
        );
      },
    );
  }
}
