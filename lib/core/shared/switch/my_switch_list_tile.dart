import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';
import 'custom_switch.dart';

class MySwitchListTile extends StatelessWidget {
  const MySwitchListTile({
    super.key,
    required this.value,
    this.onChanged,
    this.leading,
    this.title,
    this.subtitle,
    this.dense,
    this.contentPadding,
    this.shape,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final bool? dense;
  final EdgeInsetsGeometry? contentPadding;
  final ShapeBorder? shape;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
      shape: shape ?? const RoundedRectangleBorder(side: BorderSide.none),
      dense: dense,
      title: title,
      subtitle: subtitle,
      enabled: onChanged != null,
      onTap: onChanged == null ? null : () => onChanged!(!value),
      leading: leading,
      trailing: AbstractCustomSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
