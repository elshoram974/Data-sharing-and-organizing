import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

class UserGroupsScreen extends StatelessWidget {
  const UserGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithTitle(
      title: S.of(context).yourGroups,
      children: [],
    );
  }
}
