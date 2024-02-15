import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';
import '../responsive/layout_builder_responsive.dart';
import 'my_switch_list_tile.dart';

class ResMySwitchListTile extends StatelessWidget {
  const ResMySwitchListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.dense,
    this.contentPadding,
    this.shape,
    required this.value,
    this.onChanged,
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
    return LayoutBuilderRes(
      phone: MySwitchListTile(
        dense: dense,
        title: title,
        subtitle: subtitle,
        leading: leading,
        value: value,
        onChanged: onChanged,
      ),
      tablet: bigSize(),
      desktop: bigSize(),
    );
  }

  Center bigSize() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppConst.constraint),
        child: MySwitchListTile(
          dense: dense,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConst.borderRadius),
              ),
          title: title,
          subtitle: subtitle,
          leading: leading,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
