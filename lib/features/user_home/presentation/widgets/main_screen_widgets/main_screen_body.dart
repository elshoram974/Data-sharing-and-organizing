import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/main_screens.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: ProviderDependency.userMain.navController,
      onPageChanged: (_) => ProviderDependency.userMain.onNavChange(_, true),
      children: [
        for (MainScreens e in MainScreens.items) e.screen,
      ],
    );
  }
}