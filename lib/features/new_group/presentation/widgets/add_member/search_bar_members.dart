import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SearchBarMembers extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
      color: AppColor.background(context),
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: const _SuffixIcon(),
          filled: true,
          fillColor: Colors.white,
          hintText: S.of(context).searchHere,
          hintStyle: textStyle,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
          enabledBorder: outlineInputBorder,
          border: outlineInputBorder,
          constraints: const BoxConstraints(maxWidth: AppConst.constraint),
        ),
        onChanged: (val) {},
        onSubmitted: (val) {},
      ),
    );
  }

  @override
  double get maxExtent => 38.0; // Height when fully expanded

  @override
  double get minExtent => 38.0; // Height when fully collapsed

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppConst.borderRadius),
    borderSide: const BorderSide(color: AppColor.active),
  );

  final textStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.backgroundDark,
  );
}

class _SuffixIcon extends StatelessWidget {
  const _SuffixIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: IconButton(
        onPressed: () {},
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
