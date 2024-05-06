import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class BackButtonGroupDetails extends StatelessWidget {
  const BackButtonGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 28,
        left: AppConst.defaultPadding,
        right: AppConst.defaultPadding,
      ),
      width: 77,
      height: 46,
      child: const BackButtonLeading(
        showBackButton: true,
        color: Colors.black,
      ),
    );
  }
}