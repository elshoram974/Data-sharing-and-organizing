import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DeleteAccountTextInBody extends StatelessWidget {
  const DeleteAccountTextInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 245,
          child: Text(
            S.of(context).areYouSureAboutDeleteYourAccount,
            style: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: AppConst.defaultPadding,
          ),
          child: Text(
            S.of(context).deletingYourAccountWillRemoveAllOfYourInformationFromOurDatabase,
            style: AppStyle.styleRegular15.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
