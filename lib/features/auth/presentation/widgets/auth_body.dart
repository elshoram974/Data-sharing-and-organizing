import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import 'auth_app_bar/auth_app_bar.dart';
import 'auth_logo.dart';
import 'intro_auth_widget.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
    required this.introHeader,
    required this.introBody,
    this.children = const <Widget>[],
    this.showSettingsButton = true,
    this.showBackButton = true,
  });

  final String introHeader;
  final String introBody;
  final bool showSettingsButton;
  final bool showBackButton;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        AuthAppBar(
          showBackButton: showBackButton,
          showSettingsButton: showSettingsButton,
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
        const SliverToBoxAdapter(
          child: SizedBox(height: 2 * AppConst.defaultPadding),
        ),
      ],
    ).horizontalPadding(AppConst.defaultPadding);
  }
}
