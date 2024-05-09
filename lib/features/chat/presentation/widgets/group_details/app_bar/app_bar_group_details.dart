import 'package:flutter/material.dart';

import '../../../../../user_home/domain/entities/group_home_entity.dart';
import 'custom_sliver_app_bar_delegate.dart';

class AppBarGroupDetails extends StatelessWidget {
  const AppBarGroupDetails({
    super.key,
    required this.group,
    required this.membersLength,
  });

  final GroupHomeEntity group;
  final int membersLength;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomSliverAppBarDelegate(
        group: group,
        membersCount: membersLength,
      ),
    );
  }
}
