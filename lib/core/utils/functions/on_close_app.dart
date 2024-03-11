import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../config/locale/generated/l10n.dart';
import '../services/dependency/provider_dependency.dart';

bool onCloseApp({
  required BuildContext context,
  required List<String> canGoTo,
  required String currentRoute,
}) {
  bool canBack = true;
  switch (currentRoute) {
    case AppRoute.userHome:
      canBack = ProviderDependency.userMain.onWillPop();
    case AppRoute.userMyGroups:
      canBack = ProviderDependency.userHome.onWillPop();
  }

  if (!canBack) return false;
  final uri = GoRouter.of(context).routeInformationProvider.value.uri;
  bool notExitWhen = false;
  for (final String e in canGoTo) {
    notExitWhen = e == uri.path;

    if (notExitWhen) break;
  }
  if (GoRouter.of(context).canPop() || notExitWhen) return true;

  final Duration difference = DateTime.now().difference(timeBackPressed);
  if (difference <= const Duration(seconds: 2)) {
    EasyLoading.dismiss();

    return true;
  }

  EasyLoading.showToast(
    S.of(context).pressAgainToExit,
    toastPosition: EasyLoadingToastPosition.bottom,
  );

  timeBackPressed = DateTime.now();
  return false;
}
