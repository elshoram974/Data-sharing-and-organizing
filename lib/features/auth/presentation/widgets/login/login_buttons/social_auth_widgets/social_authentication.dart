import 'package:data_sharing_organizing/core/shared/my_title_divider.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import 'providers_buttons.dart';

class SocialAuthentication extends StatelessWidget {
  const SocialAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyTitleDivider(title: S.of(context).orConnectUsing)
            .bottomPadding(AppConst.defaultPadding),
        const ProvidersButtons()
      ],
    ).verticalPadding(25);
  }
}
