import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_home_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserHomeCubit, UserHomeState>(
      buildWhen: (p, c) => c is UserHomeChangeNavBar,
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: ProviderDependency.userHome.navIndex,
          showUnselectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          onTap: ProviderDependency.userHome.onNavChange,
          items: [
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.home_filled),
              icon: const Icon(Icons.home_outlined),
              tooltip: S.of(context).home,
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.notifications),
              icon: const Icon(Icons.notifications_outlined),
              tooltip: S.of(context).notification,
              label: S.of(context).notification,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.menu),
              icon: const Icon(Icons.menu_outlined),
              tooltip: S.of(context).menu,
              label: S.of(context).menu,
            ),
          ],
        );
      },
    );
  }
}
