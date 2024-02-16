import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../splash/presentation/cubit/config_cubit.dart';
import 'font_size_name_arrow.dart';

class FontScaleSlider extends StatelessWidget {
  const FontScaleSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = ProviderDependency.config;

    return Expanded(
      child: BlocBuilder<ConfigCubit, ConfigState>(
        buildWhen: (p, c) => c is ChangeFontScale,
        builder: (context, state) {
          return Slider(
            value: cubit.textScaler,
            max: cubit.scales.last,
            min: cubit.scales.first,
            label: getScaleName(cubit.textScaler, context),
            onChanged: cubit.changeFontScale,
            divisions: cubit.scales.length - 1,
          );
        },
      ),
    );
  }
}
