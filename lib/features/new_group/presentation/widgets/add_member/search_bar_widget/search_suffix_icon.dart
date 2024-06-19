import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(AppConst.borderRadius),
  borderSide: const BorderSide(color: AppColor.active),
);

const textStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: AppColor.backgroundDark,
);

class SearchSuffixIcon extends StatelessWidget {
  const SearchSuffixIcon({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: IconButton(
        onPressed: onPressed,
        color: Colors.white,
        iconSize: 21,
        style: IconButton.styleFrom(
          fixedSize: const Size.fromWidth(53),
          backgroundColor: AppColor.active,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.borderRadius),
          ),
        ),
        icon: const Icon(Icons.search_outlined),
      ),
    );
  }
}
