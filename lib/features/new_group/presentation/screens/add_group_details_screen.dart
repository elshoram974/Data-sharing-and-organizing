import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/new_group_cubit.dart';
import '../widgets/add_group_details/group_name_image.dart';
import '../widgets/add_group_details/group_permissions_tile_widget.dart';
import '../../../../core/shared/members_count_widget.dart';
import '../widgets/new_group_app_bar.dart';

class AddGroupDetailsScreen extends StatelessWidget {
  const AddGroupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewGroupCubit c = ProviderDependency.newGroup;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: c.createNewGroup,
        backgroundColor: AppColor.active,
        child: const Icon(Icons.check_rounded, color: Colors.white),
      ),
      body: BlocBuilder<NewGroupCubit, NewGroupState>(
        bloc: c,
        builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const NewGroupAppBar(),
              const GroupNameAndImage(),
              const GroupPermissionsTileWidget(),
              MembersCountWidget(selectedUsersLength: c.selectedMembers.length),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: c.selectedMembers.length,
                  (BuildContext context, int i) {
                    return ResConstrainedBoxAlign(
                      child: MembersListTile(
                        onTileTapped: () => c.cancelSelected(i),
                        memberEntity: c.selectedMembers[i],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
