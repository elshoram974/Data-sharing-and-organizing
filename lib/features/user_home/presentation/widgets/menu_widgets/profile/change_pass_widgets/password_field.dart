import 'package:data_sharing_organizing/core/shared/default_field.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.hint,
    this.label,
    required this.newPassword,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
  });

  final String? hint;
  final String? label;
  final bool newPassword;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MyDefaultField(
      autofillHints: widget.newPassword
          ? [AutofillHints.newPassword, AutofillHints.password]
          : [AutofillHints.password],
      focusNode: widget.focusNode,
      textCapitalization: TextCapitalization.none,
      textDirection: TextDirection.ltr,
      keyboardType: TextInputType.visiblePassword,
      hintText: widget.hint,
      labelText: widget.label ?? widget.hint,
      textInputAction: widget.textInputAction,
      obscureText: obscureText,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppStyle.styleRegular15.copyWith(fontSize: 18),
      style: const TextStyle(fontSize: 18, color: Colors.black87),
      suffixIconColor: AppStyle.styleRegular15.color,
      suffix: IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        iconSize: 28,
        onPressed: onPressedSuffix,
        icon: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        tooltip: obscureText
            ? S.of(context).showPassword
            : S.of(context).hidePassword,
      ),
    ).topPadding(50);
  }

  void onPressedSuffix() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
