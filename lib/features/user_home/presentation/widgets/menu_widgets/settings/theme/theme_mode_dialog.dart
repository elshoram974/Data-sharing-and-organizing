import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../../../../splash/presentation/cubit/config_cubit.dart';
import 'theme_mode_tile_in_dialog.dart';

class ThemeModesDialog extends StatelessWidget {
  const ThemeModesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = ProviderDependency.config;
    return ResConstrainedBox(
      maxWidthNotPhone: AppConst.dialogConstraint,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeModeTileInDialog(
              cubit: cubit,
              modeName: S.of(context).lightMode,
              themeMode: ThemeMode.light,
            ),
            ThemeModeTileInDialog(
              cubit: cubit,
              modeName: S.of(context).darkMode,
              themeMode: ThemeMode.dark,
            ),
            ThemeModeTileInDialog(
              cubit: cubit,
              modeName: S.of(context).deviceMode,
              themeMode: ThemeMode.system,
            ),
          ],
        ),
      ),
    );
  }
}
