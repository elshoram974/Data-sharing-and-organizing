import 'package:flutter/material.dart';

import '../utils/config/locale/generated/l10n.dart';
import '../utils/styles.dart';

class NoAccountFoundWidget extends StatelessWidget {
  const NoAccountFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).noAccountFoundMatchingThisQuery,
        style: AppStyle.styleBoldInika16,
      ),
    );
  }
}