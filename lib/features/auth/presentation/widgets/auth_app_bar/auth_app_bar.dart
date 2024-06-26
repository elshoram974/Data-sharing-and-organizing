import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:flutter/material.dart';

import 'settings_button_action.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({
    super.key,
    required this.showBackButton,
    required this.showSettingsButton,
    this.onWillPop,
    required this.previousRouteNameFunction,
  });

  final String Function(BuildContext) previousRouteNameFunction;
  final bool showBackButton;
  final void Function()? onWillPop;

  final bool showSettingsButton;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: false,
      leadingWidth: 100,
      scrolledUnderElevation: 0,
      leading: BackButtonLeading(
        showBackButton: showBackButton,
        onWillPop: onWillPop,
      ),
      actions: [
        SettingsButtonAction(
          showSettingsButton: showSettingsButton,
          previousRouteNameFunction: previousRouteNameFunction,
        ),
      ],
    );
  }
}
