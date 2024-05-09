import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../new_group/presentation/widgets/add_group_permissions/access_type/access_type_widget.dart';
import '../../../new_group/presentation/widgets/add_group_permissions/discussion_type/discussion_type_widget.dart';
import '../../../new_group/presentation/widgets/new_group_app_bar.dart';

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
            child: DiscussionTypeWidget(
              group: ProviderDependency.group.group,
              color: color,
              style: style,
            ),
          ),
          SliverToBoxAdapter(
            child: AccessTypeWidget(
              group: ProviderDependency.group.group,
              color: color,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
