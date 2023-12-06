import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/themes/app_theme.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final ConfigCubit cubit = BlocProvider.of<ConfigCubit>(context);
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Icon(Icons.dark_mode_outlined, size: 48, color: color),
          const SizedBox(width: AppConst.defaultPadding),
          Text(S.of(context).darkMode, style: style),
        ],
      ),
      value: cubit.themeMode == ThemeMode.dark || (!pref.containsKey(AppStrings.locale) && context.isDarkMode),
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
