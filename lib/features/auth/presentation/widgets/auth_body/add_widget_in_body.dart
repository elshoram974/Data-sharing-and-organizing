import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AddWidgetInBody extends StatelessWidget {
  const AddWidgetInBody({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppConst.constraint),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            ...children,
            const SizedBox(height: 2 * AppConst.defaultPadding),
          ],
        ),
      ),
    );
  }
}
