import 'package:flutter/material.dart';

import '../utils/config/locale/generated/l10n.dart';
import '../utils/constants/app_color.dart';
import '../utils/enums/fields_type_enum.dart';
import '../utils/functions/app_validate.dart';
import '../utils/styles.dart';

class GroupNameTextField extends TextFormField {
  GroupNameTextField({
    super.key,
    super.controller,
    super.style,
    super.onChanged,
    super.onEditingComplete,
    super.initialValue,
  }) : super(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) => AppValidator.auth(val, 3, 30, FieldType.name),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            hintStyle: AppStyle.styleBoldInika16,
            hintText: S.current.groupName,
            constraints: const BoxConstraints(
              maxWidth: 232,
              maxHeight: 50,
            ),
          ),
        );
}
