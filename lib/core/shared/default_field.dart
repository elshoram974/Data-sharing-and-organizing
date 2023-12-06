import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDefaultField extends StatelessWidget {
  final GlobalKey<FormFieldState>? fieldKey;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool isDouble;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextInputAction textInputAction;
  final TextDirection? textDirection;
  final int? maxLines;
  final int? minLines;
  final TextAlignVertical? textAlignVertical;
  final double? horizontalPadding;
  final double verticalPadding;
  final bool? alignLabelWithHint;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? suffixIconColor;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;
  final bool readOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  const MyDefaultField({
    super.key,
    this.labelText,
    this.controller,
    this.isDouble = false,
    this.onChanged,
    this.onSaved,
    this.textAlign = TextAlign.start,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.textDirection,
    this.maxLines = 1,
    this.minLines,
    this.horizontalPadding,
    this.verticalPadding = 0,
    this.textAlignVertical = TextAlignVertical.center,
    this.alignLabelWithHint,
    this.textCapitalization = TextCapitalization.words,
    this.fieldKey,
    this.onFieldSubmitted,
    this.filled,
    this.fillColor,
    this.suffixIconColor,
    this.suffix,
    this.prefix,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.autofillHints,
    this.onEditingComplete,
    this.inputFormatters,
    this.hintText,
    this.autofocus = false,
    this.style,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        suffixIconColor: suffixIconColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
        ),
        alignLabelWithHint: alignLabelWithHint,
        labelText: labelText,
        hintStyle: hintStyle,
        suffixIcon: suffix,
        prefixIcon: prefix,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 22,
          vertical: verticalPadding,
        ),
      ),
      readOnly: readOnly,
      textDirection: textDirection,
      autofillHints: autofillHints,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      initialValue: initialValue,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType ??
          (isDouble ? TextInputType.number : TextInputType.text),
      inputFormatters: inputFormatters,
      key: fieldKey,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      textAlignVertical: textAlignVertical,
      onSaved: onSaved,
      validator: validator,
      textAlign: textAlign,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      enableSuggestions: true,
      autofocus: autofocus,
      style: style,
    );
  }
}
