import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'back_button_leading.dart';

class EmptyScreenWithTitle extends StatelessWidget {
  const EmptyScreenWithTitle({
    super.key,
    required this.children,
    required this.title,
    this.bottomPadding = 52,
    this.actions,
  });

  final String title;
  final double bottomPadding;
  final List<Widget>? actions;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: actions,
        leadingWidth: 100,
        leading: const BackButtonLeading(showBackButton: true),
      ),
      body: ListView(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyle.styleBoldInika24.copyWith(fontSize: 36),
          ).bottomPadding(bottomPadding),
          ...children,
        ],
      ),
    );
  }
}
