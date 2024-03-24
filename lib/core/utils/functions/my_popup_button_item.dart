import 'package:flutter/material.dart';

import '../styles.dart';

PopupMenuItem<T> myPopupButton<T>(T? value, String text) {
  return PopupMenuItem<T>(
    value: value,
    child: Text(
      text,
      style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
    ),
  );
}
