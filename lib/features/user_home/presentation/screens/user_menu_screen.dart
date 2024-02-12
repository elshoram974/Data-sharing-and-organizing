import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../widgets/main_screen_widgets/main_body.dart';
import '../widgets/menu_widgets/menu_item_tile_widget.dart';

class UserMenuScreen extends StatelessWidget {
  const UserMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBodyWidget(
      children: [
        Text(S.of(context).menu),
        MenuItemTile(
          onTap: ProviderDependency.userMain.logOut,
          icon: Icons.logout,
          title: S.of(context).logout,
        ),
      ],
    );
  }
}
