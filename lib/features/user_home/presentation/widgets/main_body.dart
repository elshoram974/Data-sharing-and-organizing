
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        top: 25,
        left: AppConst.defaultPadding,
        right: AppConst.defaultPadding,
        bottom: 56,
      ),
      children: children,
    );
  }
}
