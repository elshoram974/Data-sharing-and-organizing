import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.size,
    this.radius = AppConst.borderRadius,
  });
  final double? size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(padding()),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColor.primary,
      ),
      child: SvgPicture.asset(
        AppAssets.logo,
        fit: BoxFit.contain,
      ),
    );
  }

  double padding() => size == null ? 10 : size! * 0.04286;
}
