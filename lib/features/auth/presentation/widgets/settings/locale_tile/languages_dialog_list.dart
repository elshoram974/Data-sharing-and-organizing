import 'package:data_sharing_organizing/core/utils/config/locale/class.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../splash/presentation/cubit/config_cubit.dart';

class LanguagesDialogList extends StatelessWidget {
  const LanguagesDialogList({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = ProviderDependency.config;

    return SingleChildScrollView(
      child: Column(
        children: LocaleClass.locales
            .map(
              (e) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConst.defaultPadding,
                ),
                leading: Radio<LocaleClass>(
                  value: e,
                  groupValue:
                      cubit.appLocale.languageCode == e.locale.languageCode
                          ? e
                          : null,
                  onChanged: (val) => selectLang(context, cubit, e),
                ),
                title: Text(e.languageName),
                trailing: e.isDeviceLang ? Text(S.of(context).system) : null,
                onTap: () => selectLang(context, cubit, e),
              ),
            )
            .toList(),
      ),
    );
  }

  void selectLang(BuildContext context, ConfigCubit cubit, LocaleClass e) {
    context.pop();
    cubit.changeLocale(e.locale.languageCode);
  }
}
