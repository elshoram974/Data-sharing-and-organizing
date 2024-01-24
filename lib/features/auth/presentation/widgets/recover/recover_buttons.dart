import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../auth_filled_button.dart';
import '../auth_rich_button.dart';

class RecoverButtons extends StatelessWidget {
  const RecoverButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 53),
        AuthFilledButton(
          text: S.of(context).sendRequest,
          onPressed: ProviderDependency.recoverAccount.recoverAccount,
        ),
        const SizedBox(height: 8),
        AuthRichButton(
          prefix: Icon(
            Icons.arrow_back_outlined,
            color: AppStyle.styleRegular15.color,
          ),
          prefixText: S.of(context).noNeed,
          buttonText: S.of(context).goBack,
          onTap: ProviderDependency.recoverAccount.onWillPop,
        )
      ],
    );
  }
}
