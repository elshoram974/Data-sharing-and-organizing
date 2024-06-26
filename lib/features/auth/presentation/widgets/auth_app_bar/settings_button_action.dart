import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsButtonAction extends StatelessWidget {
  const SettingsButtonAction({
    super.key,
    required this.showSettingsButton,
    required this.previousRouteNameFunction,
  });

  final bool showSettingsButton;
  final String Function(BuildContext) previousRouteNameFunction;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showSettingsButton,
      child: IconButton(
        onPressed: () => context.push(
          AppRoute.authSettings,
          extra: previousRouteNameFunction,
        ),
        tooltip: S.of(context).settings,
        icon: const Icon(Icons.settings_outlined),
      ),
    );
  }
}
