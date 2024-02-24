import 'package:data_sharing_organizing/core/shared/dialog/choose_dialog_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../splash/presentation/cubit/config_cubit.dart';

class ThemeModeTileInDialog extends StatelessWidget {
  const ThemeModeTileInDialog({
    super.key,
    required this.cubit,
    required this.themeMode,
    required this.modeName,
  });

  final ConfigCubit cubit;
  final ThemeMode themeMode;
  final String modeName;

  @override
  Widget build(BuildContext context) {
    return ChooseDialogListTile<ThemeMode>(
      title: modeName,
      value: cubit.themeMode,
      groupValue: themeMode,
      onTap: () => onTap(context),
    );
  }

  void onTap(BuildContext _) => {_.pop(), cubit.changeMode(themeMode)};
}
