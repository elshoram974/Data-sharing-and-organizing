import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/repositories/edit_profile_repositories.dart';

class DeleteScreenButtons extends StatelessWidget {
  const DeleteScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyFilledButton(
          text: S.of(context).cancel,
          filledColor: AppColor.grayLightDark(context),
          minimumSize: const Size(126, 48),
          onPressed: context.pop,
        ),
        const SizedBox(width: 0.5 * AppConst.defaultPadding),
        MyFilledButton(
          text: S.of(context).delete,
          minimumSize: const Size(126, 48),
          onPressed: () => onPressDelete(context),
        ),
      ],
    );
  }

  Future<void> onPressDelete(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false);
    final Status<bool> status = await sl
        .get<EditProfileRepositories>()
        .deleteAccount(ProviderDependency.userMain.user);
    EasyLoading.dismiss();

    if (status is Success<bool>) {
      if (status.data) {
        ProviderDependency.userMain.navIndex = 0;
        if (context.mounted) context.go(AppRoute.login);
      } else {
        EasyLoading.showError('Refused', duration: const Duration(seconds: 5));
      }
    } else {
      EasyLoading.showError(
        (status as Failure<bool>).error,
        duration: const Duration(seconds: 5),
      );
    }
  }
}
