import 'package:flutter/material.dart';

import 'lang_name.dart';

class LangNameAndArrow extends StatelessWidget {
  const LangNameAndArrow({super.key, this.makeInikaFont = false});
  final bool makeInikaFont;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LangNameWidget(makeInikaFont: makeInikaFont),
        const SizedBox(width: 20),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
