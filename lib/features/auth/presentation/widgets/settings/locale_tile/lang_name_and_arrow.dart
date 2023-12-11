import 'package:flutter/material.dart';

import 'lang_name.dart';

class LangNameAndArrow extends StatelessWidget {
  const LangNameAndArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LangNameWidget(),
        SizedBox(width: 20),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
