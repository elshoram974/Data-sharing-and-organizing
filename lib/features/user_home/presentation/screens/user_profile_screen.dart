import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../widgets/home_widgets/home_group_tile_widget/home_group_image.dart';
import '../widgets/profile/profile_tile_widget.dart';

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
          onTap: () {},
          // onTap: () => context.push(AppRoute.userEditProfile),
        ),
        ProfileTileWidget(
          title: S.of(context).changePassword,
          onTap: () => context.push(AppRoute.userChangePassword),
        ),
        ProfileTileWidget(
          title: S.of(context).yourGroups,
          onTap: () {},
          // onTap: () => context.push(AppRoute.userGroups),
        ),
        ProfileTileWidget(
          title: S.of(context).createAnotherAccount,
          onTap: () => context.push(AppRoute.signUp),
        ),
        ProfileTileWidget(
          title: S.of(context).logout,
          onTap: ProviderDependency.userMain.logOut,
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: const EdgeInsets.all(AppConst.defaultPadding / 2),
        margin: const EdgeInsets.only(
          bottom: 42,
          left: AppConst.defaultPadding,
          right: AppConst.defaultPadding,
        ),
        clipBehavior: Clip.none,
        constraints: const BoxConstraints(maxWidth: AppConst.constraint),
        decoration: BoxDecoration(
          color: AppColor.active,
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: const CardData(),
      ),
    );
  }
}

class CardData extends StatelessWidget {
  const CardData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -10,
          right: -10,
          child: EditProfileIconButton(),
        ),
        UserData(),
      ],
    );
  }
}

class EditProfileIconButton extends StatelessWidget {
  const EditProfileIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      tooltip: S.of(context).editProfile,
      icon: SizedBox.square(
        dimension: 24,
        child: SvgPicture.asset(
          AppAssets.editSquare,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    AuthUserEntity user = ProviderDependency.userMain.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(child: HomeGroupImage(imageLink: '', radius: 55)),
        Text(
          user.name,
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika24.copyWith(color: Colors.white),
        ),
        Text(
          user.email,
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika16.copyWith(color: Colors.white),
        ),
        Text(
          user.userType.name(context),
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika16.copyWith(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
