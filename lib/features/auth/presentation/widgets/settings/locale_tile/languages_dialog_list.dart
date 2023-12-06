import 'package:data_sharing_organizing/core/utils/config/locale/class.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../splash/presentation/cubit/config_cubit.dart';

class LanguagesDialogList extends StatelessWidget {
  const LanguagesDialogList({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = BlocProvider.of<ConfigCubit>(context);

    return SingleChildScrollView(
      child: Column(
        children: LocaleClass.locales
            .map(
              (e) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConst.defaultPadding,
                ),
                leading: Radio<LocaleClass>(
                    value: e, groupValue: null, onChanged: (a) {}),
                title: Text(e.languageName),
                trailing: e.isDeviceLang ? Text(S.of(context).system) : null,
                onTap: () {
                  context.pop();
                  cubit.changeLocale(e.locale.languageCode);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
