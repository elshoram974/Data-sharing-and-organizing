import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/main_screens.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.navIndex});
  final int navIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navIndex,
      showUnselectedLabels: false,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      onTap: ProviderDependency.userMain.onNavChange,
      items: [
        for (MainScreens e in MainScreens.items)
          BottomNavigationBarItem(
            activeIcon: Icon(e.activeIcon),
            icon: Icon(e.icon),
            tooltip: e.name,
            label: e.name,
          ),
      ],
    );
  }
}
