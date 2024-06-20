import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'search_suffix_icon.dart';

class SearchBarMember extends StatelessWidget {
  const SearchBarMember({
    super.key,
    this.onChanged,
    this.onSearch,
    this.maxHeight = double.infinity,
  });
  final double maxHeight;
  final void Function(String)? onChanged;
  final void Function()? onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
      color: AppColor.background(context),
      alignment: Alignment.center,
      child: TextField(
        style: textStyle,
        decoration: InputDecoration(
          suffixIcon: SearchSuffixIcon(onPressed: onSearch),
          filled: true,
          fillColor: Colors.white,
          hintText: S.of(context).searchHere,
          hintStyle: textStyle,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
          enabledBorder: outlineInputBorder,
          border: outlineInputBorder,
          constraints: BoxConstraints(
            maxHeight: maxHeight,
            maxWidth: AppConst.constraint,
          ),
        ),
        onChanged: onChanged,
        onSubmitted: onSearch != null ? (val) => onSearch!() : null,
      ),
    );
  }
}
