import 'package:data_sharing_organizing/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../config/locale/generated/l10n.dart';

bool closeApp(BuildContext context) {
  final Duration difference = DateTime.now().difference(timeBackPressed);
  if (difference <= const Duration(seconds: 2)) {
    Navigator.pop(context);

    return true;
  }

  EasyLoading.showToast(
    S.current.pressAgainToExit,
    toastPosition: EasyLoadingToastPosition.bottom,
  );

  timeBackPressed = DateTime.now();
  return false;
}
