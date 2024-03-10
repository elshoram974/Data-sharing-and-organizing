import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/menu_widgets/profile/profile_tile_widget.dart';
import '../../../widgets/menu_widgets/profile/user_card/user_card.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithTitle(
      title: S.of(context).profile,
      bottomPadding: 20,
      children: [
        const UserCard(),
        ProfileTileWidget(
          title: S.of(context).editProfile,
          onTap: () => context.push(AppRoute.userEditProfile),
        ),
        ProfileTileWidget(
          title: S.of(context).changePassword,
          onTap: () => context.push(AppRoute.userChangePassword),
        ),
        ProfileTileWidget(
          title: S.of(context).yourGroups,
          onTap: () => context.push(AppRoute.userGroups),
        ),
        ProfileTileWidget(
          title: S.of(context).createAnotherAccount,
          onTap: () => context.push(AppRoute.signUp),
        ),
        ProfileTileWidget(
          title: S.of(context).deleteAccount,
          onTap: () => context.push(AppRoute.deleteAccount),
        ),
        ProfileTileWidget(
          title: S.of(context).logout,
          onTap: ProviderDependency.userMain.logOut,
        ),
      ],
    );
  }
}
