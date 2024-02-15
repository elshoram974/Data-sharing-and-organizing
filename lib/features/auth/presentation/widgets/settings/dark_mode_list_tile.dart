import 'package:data_sharing_organizing/core/shared/switch/my_switch_list_tile.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/services/dependency/provider_dependency.dart';
import '../../../../splash/presentation/cubit/config_cubit.dart';

class DarkModeListTile extends StatelessWidget {
  const DarkModeListTile({
    super.key,
    required this.color,
    required this.style,
  });

  final Color? color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = ProviderDependency.config;
    return MySwitchListTile(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConst.borderRadius)),
      title: Row(
        children: [
          Icon(Icons.dark_mode_outlined, color: color),
          const SizedBox(width: AppConst.defaultPadding),
          Text(S.of(context).darkMode, style: style),
        ],
      ),
      value: cubit.appIsDark,
      onChanged: (value) {
        if (value) {
          cubit.changeMode(ThemeMode.dark);
        } else {
          cubit.changeMode(ThemeMode.light);
        }
      },
    );
  }
}
