import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class IntroAuthWidget extends StatelessWidget {
  const IntroAuthWidget({
    super.key,
    required this.header,
    required this.body,
  });
  final String header;
  final String body;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 70,
        bottom: 3,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(header, style: AppStyle.styleBoldInika24),
            Text(body, style: AppStyle.styleRegular15),
          ],
        ),
      ),
    );
  }
}
