import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class IntroAuthWidget extends StatelessWidget {
  const IntroAuthWidget({
    super.key,
    required this.header,
    required this.body,
    required this.crossAxisAlignment,
  });
  final String header;
  final String body;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
        bottom: 3,
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(header, style: AppStyle.styleBoldInika24),
          Text(body, style: AppStyle.styleRegular15),
        ],
      ),
    );
  }
}
