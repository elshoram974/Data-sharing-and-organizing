import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/main_screens.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.navIndex});
  final int navIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 4,
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
          ),
        ]
      ),
      child: BottomNavigationBar(
        currentIndex: navIndex,
        showUnselectedLabels: false,
        backgroundColor: AppColor.background(context),
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        selectedItemColor: AppColor.active,
        onTap: (_) => ProviderDependency.userMain.onNavChange(_, false),
        items: [
          for (MainScreens e in MainScreens.getItems(context))
            BottomNavigationBarItem(
              activeIcon: Icon(e.activeIcon),
              icon: Icon(e.icon),
              tooltip: e.name,
              label: e.name,
            ),
        ],
      ),
    );
  }
}
