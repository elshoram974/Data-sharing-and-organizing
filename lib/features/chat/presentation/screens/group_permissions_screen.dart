import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../new_group/presentation/widgets/new_group_app_bar.dart';
import '../widgets/group_details/group_permissions/access_type/access_type_widget.dart';
import '../widgets/group_details/group_permissions/discussion_type/discussion_type_widget.dart';

class GroupPermissionsScreen extends StatelessWidget {
  const GroupPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontFamily: AppStrings.inika, fontSize: 20);
    final Color color = style?.color ?? Colors.black;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          NewGroupAppBar(title: S.of(context).groupPermissions),
          SliverToBoxAdapter(
            child: DiscussionTypeWidget(color: color, style: style),
          ),
          SliverToBoxAdapter(
            child: AccessTypeWidget(color: color, style: style),
          ),
        ],
      ),
    );
  }
}
