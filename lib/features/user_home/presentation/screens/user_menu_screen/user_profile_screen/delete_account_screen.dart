import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../widgets/menu_widgets/profile/delete_account_widgets/delete_account_text_in_body.dart';
import '../../../widgets/menu_widgets/profile/delete_account_widgets/delete_screen_buttons.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithTitle(
      title: S.of(context).deleteAccount,
      bottomPadding: 152,
      children: const [
        DeleteAccountTextInBody(),
        SizedBox(height: 85),
        DeleteScreenButtons(),
        SizedBox(height: 85),
      ],
    );
  }
}
