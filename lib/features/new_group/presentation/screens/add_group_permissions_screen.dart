import 'package:data_sharing_organizing/core/shared/group_permission_edit/access_type/access_type_widget.dart';
import 'package:data_sharing_organizing/core/shared/group_permission_edit/discussion_type/discussion_type_widget.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/new_group_cubit.dart';
import '../widgets/new_group_app_bar.dart';

class AddGroupPermissionsScreen extends StatelessWidget {
  const AddGroupPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontFamily: AppStrings.inika, fontSize: 20);
    final Color color = style?.color ?? Colors.black;
    final NewGroupCubit c = ProviderDependency.newGroup;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          NewGroupAppBar(title: S.of(context).groupPermissions),
          SliverToBoxAdapter(
            child: BlocBuilder<NewGroupCubit, NewGroupState>(
              bloc: c,
              buildWhen: (p, c) => c is ChangeGroupDiscussionType,
              builder: (context, state) {
                return DiscussionTypeWidget(
                  discussion: c.discussionType,
                  color: color,
                  style: style,
                  onSelect: c.changeDiscussionType,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<NewGroupCubit, NewGroupState>(
              bloc: c,
              buildWhen: (p, c) => c is ChangeGroupAccessType,
              builder: (context, state) {
                return AccessTypeWidget(
                  accessType: c.accessType,
                  color: color,
                  style: style,
                  onSelect: c.changeAccessType,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
