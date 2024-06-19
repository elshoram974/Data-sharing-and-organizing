import 'package:flutter/material.dart';

import '../styles.dart';

PopupMenuItem<T> myPopupButton<T>(
  T? value,
  String text, [
  void Function()? onTap,
]) {
  return PopupMenuItem<T>(
    value: value,
    onTap: onTap,
    child: Text(
      text,
      style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
    ),
  );
}
