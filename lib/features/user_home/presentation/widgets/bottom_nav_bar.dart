import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      showUnselectedLabels: false,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      onTap: (value) {},
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
  }
}
