import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:data_sharing_organizing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({
    super.key,
    required this.showBackButton,
    required this.showSettingsButton,
  });

  final bool showBackButton;
  final bool showSettingsButton;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      leadingWidth: 100,
      leading: Visibility(
        visible: showBackButton,
        child: InkWell(
          onTap: context.pop,
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.arrow_back_outlined),
              Text(S.of(context).back, style: AppStyle.styleBold20),
            ],
          ),

          // icon: const Icon(Icons.settings_outlined),
        ),
      ),
      actions: [
        Visibility(
          visible: showSettingsButton,
          child: IconButton(
            onPressed: () => context.push(AppRoute.authSettingsScreen),
            tooltip: S.of(context).settings,
            icon: const Icon(Icons.settings_outlined),
          ),
        ),
      ],
    );
  }
}
