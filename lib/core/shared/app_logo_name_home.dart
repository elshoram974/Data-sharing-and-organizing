import 'package:flutter/material.dart';

import '../utils/config/locale/generated/l10n.dart';
import '../utils/styles.dart';
import 'logo_widget.dart';

class AppLogoWithNameHome extends StatelessWidget {
  const AppLogoWithNameHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LogoWidget(size: 32, radius: 5),
        const SizedBox(width: 2),
        Text(
          S.of(context).sharikna,
          style: AppStyle.styleRegular24.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
