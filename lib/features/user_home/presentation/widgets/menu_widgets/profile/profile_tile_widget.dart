import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/extension/responsive_ex.dart';
import 'package:flutter/material.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key,
    this.onTap,
    required this.title,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBoxAlign(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
        shape: context.isPhoneWidth
            ? const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConst.borderRadius)),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: AppStrings.inika),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ).bottomPadding(34),
    );
  }
}
