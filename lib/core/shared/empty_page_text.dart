import 'package:flutter/material.dart';

import '../utils/styles.dart';

class EmptyPageText extends StatelessWidget {
  const EmptyPageText(this.message, {super.key, this.height});
  final String message;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? MediaQuery.sizeOf(context).height - 280,
      alignment: Alignment.center,
      child: Text(message, style: AppStyle.styleBoldInika16),
    );
  }
}