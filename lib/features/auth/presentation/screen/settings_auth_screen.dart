import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../splash/presentation/cubit/config_cubit.dart';
import '../widgets/auth_body.dart';
import '../widgets/settings/dark_mode_list_tile.dart';
import '../widgets/settings/locale_tile/language_list_tile.dart';
import '../widgets/settings/return_to_previous_route.dart';

class AuthSettingsScreen extends StatelessWidget {
  final String Function(BuildContext) previousRouteNameFunction;
  const AuthSettingsScreen(
      {super.key, required this.previousRouteNameFunction});

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context).textTheme.titleLarge;
    final Color? color = style?.color;
    final double h = MediaQuery.sizeOf(context).height;
    ProviderDependency.config = BlocProvider.of<ConfigCubit>(context);

    return Scaffold(
      body: AuthBody(
        previousRouteNameFunction: (_) => S.of(_).settings,
        introHeader: S.of(context).settings,
        showSettingsButton: false,
        introBody: '',
        children: [
          SizedBox(height: h * 0.08),
          LanguageListTile(color: color, style: style),
          SizedBox(height: h * 0.05),
          DarkModeListTile(color: color, style: style),
          SizedBox(height: h * 0.06),
          ReturnToPreviousRoute(
              previousRouteNameFunction: previousRouteNameFunction),
        ],
      ),
    );
  }
}
