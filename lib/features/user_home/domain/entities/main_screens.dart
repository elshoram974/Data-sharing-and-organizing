import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/cubit/user_notification_cubit/user_notification_cubit.dart';
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
          screen: const _UserNotificationScreenWithCubit(),
        ),
        MainScreens(
          name: S.of(context).menu,
          icon: Icons.menu_outlined,
          activeIcon: Icons.menu,
          screen: const UserMenuScreen(),
        ),
      ];
}

class _UserNotificationScreenWithCubit extends StatelessWidget {
  const _UserNotificationScreenWithCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<UserNotificationCubit>(),
      child: const UserNotificationScreen(),
    );
  }
}
