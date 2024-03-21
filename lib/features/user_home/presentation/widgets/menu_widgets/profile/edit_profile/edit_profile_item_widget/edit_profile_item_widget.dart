import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'label_with_icon_widget.dart';
import 'name_with_edit_widget.dart';

class EditProfileItemWidget extends StatelessWidget {
  const EditProfileItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.textBody,
    this.onPressEdit,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final String textBody;
  final bool showDivider;
  final void Function()? onPressEdit;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.only(
          left: AppConst.defaultPadding,
          right: AppConst.defaultPadding,
          top: 20,
        ),
        constraints: const BoxConstraints(maxWidth: AppConst.constraint),
        child: Column(
          children: [
            LabelWithIconWidget(icon: icon, label: label),
            NameWithEditButtonWidget(
              textBody: textBody,
              onPressEdit: onPressEdit,
            ),
            const SizedBox(height: 20),
            if (showDivider) const Divider(),
          ],
        ),
      ),
    );
  }
}
