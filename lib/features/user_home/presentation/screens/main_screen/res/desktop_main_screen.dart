import 'package:flutter/material.dart';

import '../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../widgets/main_screen_widgets/main_screen_body.dart';
import '../../../widgets/main_screen_widgets/main_user_app_bar.dart';
import '../../../widgets/main_screen_widgets/navigation_bar/rail_nav_bar.dart';
import '../user_main_screen.dart';

class UserMainScreensInDesktop extends StatelessWidget {
  const UserMainScreensInDesktop({
    super.key,
    required this.navIndex,
    required this.user,
  });

  final int navIndex;
  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainUserAppBar(),
      floatingActionButton: getHomeNav(navIndex, user),
      body: Row(
        children: [
          NavigationRailBar(navIndex: navIndex, inDesktopSize: true),
          const Expanded(child: MainScreenBody()),
        ],
      ),
    );
  }
}
