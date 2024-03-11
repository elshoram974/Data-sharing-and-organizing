import 'package:flutter/material.dart';

import '../utils/constants/app_constants.dart';

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}