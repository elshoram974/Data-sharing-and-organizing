import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class EditNameButtons extends StatelessWidget {
  const EditNameButtons({super.key});

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
          text: S.of(context).confirm,
          minimumSize: const Size(126, 48),
          onPressed: ProviderDependency.groupDetails.changeGroupName,
        ),
      ],
    ).topPadding(200);
  }
}
