import 'package:data_sharing_organizing/core/utils/config/locale/class.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:data_sharing_organizing/features/splash/presentation/cubit/config_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangNameAndArrow extends StatelessWidget {
  const LangNameAndArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = BlocProvider.of<ConfigCubit>(context);
    final LocaleClass locale = LocaleClass.fromCurrent(cubit.appLocale);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(locale.languageName, style: AppStyle.styleRegular15),
        const SizedBox(width: 20),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
