import 'package:flutter/material.dart';

import '../../widgets/main_screen_widgets/main_screen_body.dart';
import '../../widgets/main_screen_widgets/main_user_app_bar.dart';
import '../../widgets/main_screen_widgets/navigation_bar/rail_nav_bar.dart';
import 'user_main_screen.dart';

class UserMainScreensInTablet extends StatelessWidget {
  const UserMainScreensInTablet({super.key, required this.navIndex});

  final int navIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainUserAppBar(),
      floatingActionButton: getHomeNav(navIndex),
      body: Row(
        children: [
          NavigationRailBar(navIndex: navIndex, inDesktopSize: false),
          const Expanded(child: MainScreenBody()),
        ],
      ),
    );
  }
}