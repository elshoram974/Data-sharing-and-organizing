import 'package:data_sharing_organizing/core/shared/dialog/choose_dialog_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/class.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../splash/presentation/cubit/config_cubit.dart';

class LanguagesDialogList extends StatelessWidget {
  const LanguagesDialogList({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit = ProviderDependency.config;

    return ResConstrainedBox(
      maxWidthNotPhone: AppConst.dialogConstraint,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: LocaleClass.locales
              .map(
                (e) => ChooseDialogListTile<LocaleClass>(
                  title: e.languageName,
                  value: e,
                  groupValue:
                      cubit.appLocale.languageCode == e.locale.languageCode
                          ? e
                          : null,
                  trailing: e.isDeviceLang
                      ? Text(
                          S.of(context).system,
                          style:
                              AppStyle.styleBoldInika16.copyWith(fontSize: 10),
                        )
                      : null,
                  onTap: () => selectLang(context, cubit, e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void selectLang(BuildContext context, ConfigCubit cubit, LocaleClass e) {
    context.pop();
    cubit.changeLocale(e.locale.languageCode);
  }
}
