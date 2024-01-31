import 'package:data_sharing_organizing/core/utils/config/locale/class.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/services/dependency/provider_dependency.dart';
import '../../../../../splash/presentation/cubit/config_cubit.dart';

class LangNameWidget extends StatelessWidget {
  const LangNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = ProviderDependency.config;

    return BlocBuilder<ConfigCubit, ConfigState>(
      buildWhen: (previous, current) => current is ChangeLanguage,
      builder: (context, state) {
        final LocaleClass locale = LocaleClass.fromCurrent(cubit.appLocale);
        return Text(locale.languageName, style: AppStyle.styleRegular15);
      },
    );
  }
}
