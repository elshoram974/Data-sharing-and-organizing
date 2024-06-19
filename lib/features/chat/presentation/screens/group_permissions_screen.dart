import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../new_group/presentation/widgets/add_group_permissions/access_type/access_type_widget.dart';
import '../../../new_group/presentation/widgets/add_group_permissions/discussion_type/discussion_type_widget.dart';
import '../../../new_group/presentation/widgets/new_group_app_bar.dart';
import '../cubit/group_details/group_details_cubit.dart';

class GroupPermissionsScreen extends StatelessWidget {
  const GroupPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontFamily: AppStrings.inika, fontSize: 20);
    final Color color = style?.color ?? Colors.black;
    final GroupDetailsCubitImp c = ProviderDependency.groupDetails;
    return Scaffold(
      body: BlocBuilder<GroupDetailsCubitImp, GroupDetailsState>(
        bloc: ProviderDependency.groupDetails,
        buildWhen: (p, c) => c is ChangePermissionsSuccessState,
        builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              NewGroupAppBar(title: S.of(context).groupPermissions),
              SliverToBoxAdapter(
                child: DiscussionTypeWidget(
                  group: c.group,
                  color: color,
                  style: style,
                  onSelect: (d) => c.changePermissions(d, null),
                ),
              ),
              SliverToBoxAdapter(
                child: AccessTypeWidget(
                  group: c.group,
                  color: color,
                  style: style,
                  onSelect: (a) => c.changePermissions(null, a),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
