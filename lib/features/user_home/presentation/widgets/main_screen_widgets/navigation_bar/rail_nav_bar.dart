import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/main_screens.dart';

class NavigationRailBar extends StatelessWidget {
  const NavigationRailBar({
    super.key,
    required this.navIndex,
    required this.inDesktopSize,
  });

  final int navIndex;
  final bool inDesktopSize;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: navIndex,
      labelType: inDesktopSize ? null : NavigationRailLabelType.selected,
      groupAlignment: -0.3,
      extended: inDesktopSize,
      useIndicator: true,
      elevation: 10,
      selectedIconTheme: const IconThemeData(color: AppColor.active),
      selectedLabelTextStyle: TextStyle(
        color: AppColor.active,
        fontSize: inDesktopSize ? 14 : null,
        fontWeight: FontWeight.bold,
      ),
      onDestinationSelected: (_) => ProviderDependency.userMain.onNavChange(_, false),
      destinations: [
        for (MainScreens e in MainScreens.getItems(context))
          NavigationRailDestination(
            icon: Icon(e.icon),
            selectedIcon: Icon(e.activeIcon),
            label: Text(e.name),
          ),
      ],
    );
  }
}
