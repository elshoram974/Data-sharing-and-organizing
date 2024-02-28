import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../presentation/screens/user_home_screen.dart';
import '../../presentation/screens/user_menu_screen/user_menu_screen.dart';
import '../../presentation/screens/user_notification_screen.dart';

final class MainScreens {
  const MainScreens({
    required this.name,
    required this.icon,
    required this.activeIcon,
    required this.screen,
  });
  final String name;
  final IconData activeIcon;
  final IconData icon;
  final Widget screen;

  static List<MainScreens> getItems(BuildContext context) => [
        MainScreens(
          name: S.of(context).home,
          icon: Icons.home_outlined,
          activeIcon: Icons.home,
          screen: const UserHomeScreen(),
        ),
        MainScreens(
          name: S.of(context).notification,
          icon: Icons.notifications_outlined,
          activeIcon: Icons.notifications,
          screen: const UserNotificationScreen(),
        ),
        MainScreens(
          name: S.of(context).menu,
          icon: Icons.menu_outlined,
          activeIcon: Icons.menu,
          screen: const UserMenuScreen(),
        ),
      ];
}
