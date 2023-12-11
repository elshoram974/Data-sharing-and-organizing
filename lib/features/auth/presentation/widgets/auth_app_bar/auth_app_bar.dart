import 'package:flutter/material.dart';

import 'back_button_leading.dart';
import 'settings_button_action.dart';

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
      scrolledUnderElevation: 0,
      leading: BackButtonLeading(showBackButton: showBackButton),
      actions: [
        SettingsButtonAction(showSettingsButton: showSettingsButton),
      ],
    );
  }
}