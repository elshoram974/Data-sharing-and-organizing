import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'auth_field.dart';

class AuthPasswordField extends StatefulWidget {
  const AuthPasswordField({
    super.key,
    required this.label,
    this.hint,
    required this.newPassword,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
  });

  final String label;
  final String? hint;
  final bool newPassword;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AuthField(
      label: widget.label,
      hint: widget.hint,
      focusNode: widget.focusNode,
      autofillHints: widget.newPassword
          ? [AutofillHints.newPassword, AutofillHints.password]
          : [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: obscureText,
      suffix: obscureText
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined,
      suffixTooltip:
          obscureText ? S.of(context).showPassword : S.of(context).hidePassword,
      onPressedSuffix: onPressedSuffix,
    );
  }

  void onPressedSuffix() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
