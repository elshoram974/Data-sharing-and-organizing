import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../widgets/main_screen_widgets/main_body.dart';

class UserMenuScreen extends StatelessWidget {
  const UserMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBodyWidget(
      children: [
        Text(S.of(context).menu),
      ],
    );
  }
}
