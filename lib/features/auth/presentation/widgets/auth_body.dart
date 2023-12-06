import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_logo.dart';
import 'intro_auth_widget.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
    required this.introHeader,
    required this.introBody,
    this.children = const <Widget>[],
    this.showSettingsButton = true,
  });

  final String introHeader;
  final String introBody;
  final bool showSettingsButton;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.defaultPadding,
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
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
          ),
          const AuthLogo(),
          IntroAuthWidget(
            header: introHeader,
            body: introBody,
          ),
          SliverToBoxAdapter(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
