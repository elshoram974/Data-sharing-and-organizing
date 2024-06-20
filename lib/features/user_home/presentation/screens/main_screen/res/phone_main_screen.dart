import 'package:flutter/material.dart';

import '../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../widgets/main_screen_widgets/main_screen_body.dart';
import '../../../widgets/main_screen_widgets/main_user_app_bar.dart';
import '../../../widgets/main_screen_widgets/navigation_bar/bottom_nav_bar.dart';
import '../user_main_screen.dart';

class UserMainScreensInPhone extends StatelessWidget {
  const UserMainScreensInPhone({
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
      bottomNavigationBar: BottomNavBar(navIndex: navIndex),
      floatingActionButton: getHomeNav(navIndex, user),
      body: const MainScreenBody(),
    );
  }
}
