import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/member_entity.dart';
import 'package:data_sharing_organizing/features/user_home/domain/entities/group_home_entity.dart';
import 'package:flutter/material.dart';
import '../widgets/add_group_permissions/access_type/access_type_widget.dart';
import '../widgets/add_group_permissions/discussion_type/discussion_type_widget.dart';
import '../widgets/new_group_app_bar.dart';

class AddGroupPermissionsScreen extends StatelessWidget {
  const AddGroupPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final g = GroupHomeEntity(
      groupId: -4,
      screen: 0,
      groupName: 'groupName',
      ownerId: 1,
      discussion: GroupDiscussionType.exist,
      memberEntity: MemberEntity(
        user: ProviderDependency.userMain.user,
        groupId: -4,
        canInteract: false,
        joinDate: DateTime.now(),
        isAdmin: true,
      ),
      createdAt: DateTime.now(),
    );
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
              group: g,
              color: color,
              style: style,
            ),
          ),
          SliverToBoxAdapter(
            child: AccessTypeWidget(
              group: g,
              color: color,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
