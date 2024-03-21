import 'package:data_sharing_organizing/core/shared/default_field.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NameFieldWidget extends StatelessWidget {
  const NameFieldWidget({
    super.key,
    this.initialValue,
    this.autofillHints,
    required this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.textInputAction = TextInputAction.next,
  });

  final String? initialValue;
  final String? hintText;
  final List<String>? autofillHints;
  final TextInputAction textInputAction;
  final void Function(String) onChanged;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return MyDefaultField(
      initialValue: initialValue,
      autofillHints: autofillHints?..add(AutofillHints.name),
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      hintText: hintText,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: (val) => AppValidator.auth(val, 3, 20, FieldType.name),
      onFieldSubmitted: onFieldSubmitted,
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppStyle.styleRegular15.copyWith(fontSize: 18),
      style: const TextStyle(fontSize: 18, color: Colors.black87),
    ).topPadding(50);
  }
}
