import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../../chat/domain/repositories/group_details_repo.dart';
import '../cubit/new_group_cubit.dart';
import '../widgets/add_member/search_bar_widget/search_bar_members_persistent_header.dart';
import '../widgets/new_group_app_bar.dart';

class AddMembersScreen extends StatelessWidget {
  const AddMembersScreen({super.key, required this.user});

  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewGroupCubit(
        user: user,
        groupDetailsRepo: sl.get<GroupDetailsRepositories>(),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push(AppRoute.addGroupDetails),
          backgroundColor: AppColor.active,
          child: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
        body: const AddMembersBody(),
      ),
    );
  }
}

class AddMembersBody extends StatelessWidget {
  const AddMembersBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.newGroup = BlocProvider.of<NewGroupCubit>(context);
    final List selectedUsers = []; // TODO: selected users

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        NewGroupAppBar(
          subTitle: selectedUsers.isNotEmpty
              ? S.of(context).selectedWithNumber(selectedUsers.length)
              : "(${S.of(context).addMembers})",
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SearchBarMembersPersistentHeader(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: selectedUsers.length,
            (BuildContext context, int i) {
              return ResConstrainedBoxAlign(
                child: MembersListTile(
                  onTileTapped: () {},
                  memberEntity: MemberListTileEntity(
                    id: selectedUsers[i].memberId,
                    isAdmin: selectedUsers[i].isAdmin,
                    isBlocked: false,
                    name:
                        '${selectedUsers[i].firstName} ${selectedUsers[i].lastName}}',
                    imageLink: selectedUsers[i].image,
                    lastLogin: selectedUsers[i].lastLogin,
                    isSelected: false,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
