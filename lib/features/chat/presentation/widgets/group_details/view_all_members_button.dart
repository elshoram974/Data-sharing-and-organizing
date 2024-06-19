import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../data/models/group_details_members/group_members_model.dart';
import '../../cubit/group_details/group_details_cubit.dart';
import 'members_list_group_details.dart';

class ViewAllMembersButton extends StatelessWidget {
  const ViewAllMembersButton({
    super.key,
    required this.list,
    required this.group,
  });

  final List<GroupMember> list;
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    _AllMembersScreen(group: group, list: list),
              ),
            );
          },
          child: Text(S.of(context).viewAllCountMore(list.length - 6)),
        ),
      ),
    );
  }
}

class _AllMembersScreen extends StatelessWidget {
  const _AllMembersScreen({
    required this.group,
    required this.list,
  });

  final GroupHomeEntity group;
  final List<GroupMember> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GroupDetailsCubitImp, GroupDetailsState>(
        bloc: ProviderDependency.groupDetails,
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(group.groupName),
                backgroundColor: AppColor.background(context),
                pinned: true,
              ),
              MembersListGroupDetails(list: list, group: group),
            ],
          );
        },
      ),
    );
  }
}
