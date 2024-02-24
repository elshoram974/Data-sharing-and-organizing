import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/config/routes/routes.dart';
import '../../widgets/main_screen_widgets/main_body.dart';
import '../../widgets/menu_widgets/menu_item_tile_widget.dart';

class UserMenuScreen extends StatelessWidget {
  const UserMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBodyWidget(
      makeHorizontalPadding: false,
      children: [
        MenuItemTile(
          icon: Icons.person,
          title: S.of(context).profile,
          onTap: () => context.push(AppRoute.userProfile),
        ),
        MenuItemTile(
          icon: Icons.notifications,
          title: S.of(context).notification,
          onTap: () => context.push(AppRoute.userNotificationsSettings),
        ),
        MenuItemTile(
          icon: Icons.security,
          title: S.of(context).privacyAndSecurity,
        ),
        MenuItemTile(
          icon: Icons.headset_mic,
          title: S.of(context).support,
        ),
        MenuItemTile(
          icon: Icons.settings,
          title: S.of(context).settings,
          onTap: () => context.push(AppRoute.userSettings),
        ),
        MenuItemTile(
          onTap: ProviderDependency.userMain.logOut,
          icon: Icons.logout,
          title: S.of(context).logout,
        ),
      ],
    );
  }
}
