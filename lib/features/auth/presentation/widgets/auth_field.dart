import 'package:data_sharing_organizing/core/shared/default_field.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    this.autofillHints,
    this.keyboardType,
    this.hint,
    this.obscureText = false,
    this.suffix,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onPressedSuffix,
    this.onChanged,
    this.validator,
    this.suffixTooltip,
    this.textInputAction = TextInputAction.next,
  });

  final String label;
  final String? hint;
  final String? suffixTooltip;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? suffix;
  final TextInputAction textInputAction;

  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onPressedSuffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          MyDefaultField(
            autofillHints: autofillHints,
            keyboardType: keyboardType,
            hintText: hint,
            textInputAction: textInputAction,
            obscureText: obscureText,
            onSaved: onSaved,
            onChanged: onChanged,
            validator: validator,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            filled: true,
            fillColor: Colors.white,
            hintStyle: AppStyle.styleRegular15.copyWith(fontSize: 18),
            style: const TextStyle(fontSize: 18, color: Colors.black87),
            suffixIconColor: AppStyle.styleRegular15.color,
            suffix: suffix != null
                ? IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    iconSize: 28,
                    onPressed: onPressedSuffix,
                    icon: Icon(suffix),
                    tooltip: suffixTooltip,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
