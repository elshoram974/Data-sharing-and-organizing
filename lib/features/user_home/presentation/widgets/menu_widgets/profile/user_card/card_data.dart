import 'package:flutter/material.dart';

import '../edit_profile_icon_button.dart';
import 'user_data_widget.dart';

class CardData extends StatelessWidget {
  const CardData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -10,
          right: -10,
          child: EditProfileIconButton(),
        ),
        UserDataWidget(),
      ],
    );
  }
}
