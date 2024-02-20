import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../widgets/profile/profile_tile_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithTitle(
      title: S.of(context).profile,
      children: [
        ProfileTileWidget(
          title: S.of(context).editProfile,
          onTap: () {},
        ),
        ProfileTileWidget(
          title: S.of(context).changePassword,
          onTap: () {},
        ),
        ProfileTileWidget(
          title: S.of(context).yourGroups,
          onTap: () {},
        ),
        ProfileTileWidget(
          title: S.of(context).createAnotherAccount,
          onTap: () {},
        ),
        ProfileTileWidget(
          title: S.of(context).logout,
          onTap: ProviderDependency.userMain.logOut,
        ),
      ],
    );
  }
}
