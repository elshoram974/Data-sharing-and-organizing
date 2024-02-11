import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../widgets/main_body.dart';

class UserNotificationScreen extends StatelessWidget {
  const UserNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBodyWidget(
        children: [
          Text(S.of(context).notification),
        ],
      ),
    );
  }
}
