import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../splash/presentation/cubit/config_cubit.dart';
import '../name_arrow_widget.dart';

class FontSizeNameAndArrow extends StatelessWidget {
  const FontSizeNameAndArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = ProviderDependency.config;

    return BlocBuilder<ConfigCubit, ConfigState>(
      buildWhen: (previous, current) => current is ChangeFontScale,
      builder: (context, state) {
        return NameAndArrowWidget(
            name: getScaleName(cubit.textScaler, context) ?? '');
      },
    );
  }
}

String? getScaleName(double scale, BuildContext context) {
  switch (scale) {
    case >= 1.5:
      return S.of(context).extraLarge;
    case >= 1.2:
      return S.of(context).large;
    case >= 1:
      return S.of(context).defaultScale;
    case >= 0.8:
      return S.of(context).small;
    default:
      return null;
  }
}
