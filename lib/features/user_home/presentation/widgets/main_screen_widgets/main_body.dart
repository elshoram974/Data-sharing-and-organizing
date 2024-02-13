import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({
    super.key,
    required this.children,
    this.makeHorizontalPadding = true,
  });
  final List<Widget> children;
  final bool makeHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: 25,
        left: makeHorizontalPadding ? AppConst.defaultPadding : 0,
        right: makeHorizontalPadding ? AppConst.defaultPadding : 0,
        bottom: 56,
      ),
      children: children,
    );
  }
}
