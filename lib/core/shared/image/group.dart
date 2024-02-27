import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_assets.dart';

class GroupImage extends StatelessWidget {
  const GroupImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SvgPicture.asset(
        AppAssets.group,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
