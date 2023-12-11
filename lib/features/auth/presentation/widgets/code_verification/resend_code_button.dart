import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../auth_rich_button.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthRichButton(
      prefix: SvgPicture.asset(
        AppAssets.pathArrow,
        fit: BoxFit.contain,
        height: 17,
      ),
      prefixText: S.of(context).noCodeReceived,
      buttonText: S.of(context).resend,
    );
  }
}
