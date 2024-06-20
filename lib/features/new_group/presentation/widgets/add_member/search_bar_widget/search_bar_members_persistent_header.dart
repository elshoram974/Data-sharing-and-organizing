import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../cubit/new_group_cubit.dart';
import 'search_bar_members.dart';

class SearchBarMembersPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final NewGroupCubit c = ProviderDependency.newGroup;
    return SearchBarMember(
      maxHeight: 40,
      onSearch: c.searchMembers,
      onChanged: c.onChangeQuery,
    );
  }

  @override
  double get maxExtent => 38.0; // Height when fully expanded

  @override
  double get minExtent => 38.0; // Height when fully collapsed

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
