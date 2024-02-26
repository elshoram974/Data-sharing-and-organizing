import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'card_data.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: const EdgeInsets.all(AppConst.defaultPadding / 2),
        margin: const EdgeInsets.only(
          bottom: 42,
          left: AppConst.defaultPadding,
          right: AppConst.defaultPadding,
        ),
        clipBehavior: Clip.none,
        constraints: const BoxConstraints(maxWidth: AppConst.constraint),
        decoration: BoxDecoration(
          color: AppColor.active,
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: const CardData(),
      ),
    );
  }
}
