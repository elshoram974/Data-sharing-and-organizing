import 'package:data_sharing_organizing/core/utils/config/locale/class.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../splash/presentation/cubit/config_cubit.dart';

class LangNameWidget extends StatelessWidget {
  const LangNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = BlocProvider.of<ConfigCubit>(context);

    return BlocBuilder<ConfigCubit, ConfigState>(
      buildWhen: (previous, current) => current is ChangeLanguage,
      builder: (context, state) {
        final LocaleClass locale = LocaleClass.fromCurrent(cubit.appLocale);
        return Text(locale.languageName, style: AppStyle.styleRegular15);
      },
    );
  }
}
