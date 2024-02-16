import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../splash/presentation/cubit/config_cubit.dart';
import '../name_arrow_widget.dart';

class ThemeModeNameAndArrow extends StatelessWidget {
  const ThemeModeNameAndArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = ProviderDependency.config;

    return BlocBuilder<ConfigCubit, ConfigState>(
      buildWhen: (previous, current) => current is ChangeThemeMode,
      builder: (context, state) {
        return NameAndArrowWidget(name: themeName(cubit.themeMode, context));
      },
    );
  }

  String themeName(ThemeMode mode, BuildContext context) {
    switch (mode) {
      case ThemeMode.light:
        return S.of(context).lightMode;
      case ThemeMode.dark:
        return S.of(context).darkMode;
      default:
        return S.of(context).deviceMode;
    }
  }
}
