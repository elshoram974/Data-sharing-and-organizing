import 'package:flutter/material.dart';

import 'search_bar_members.dart';

class SearchBarMembersPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const SearchBarMember();
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
