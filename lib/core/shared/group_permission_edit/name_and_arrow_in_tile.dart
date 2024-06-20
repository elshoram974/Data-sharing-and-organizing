import 'package:flutter/material.dart';

import '../../../features/user_home/presentation/widgets/menu_widgets/settings/name_arrow_widget.dart';

class NameAndArrowInTile extends StatelessWidget {
  const NameAndArrowInTile(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth / 2.6,
          child: NameAndArrowWidget(name: name),
        );
      },
    );
  }
}
