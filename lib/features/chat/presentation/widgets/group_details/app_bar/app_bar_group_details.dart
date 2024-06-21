import 'package:flutter/material.dart';

import 'custom_sliver_app_bar_delegate.dart';

class AppBarGroupDetails extends StatelessWidget {
  const AppBarGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomSliverAppBarDelegate(),
    );
  }
}
