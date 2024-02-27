import 'package:data_sharing_organizing/core/shared/empty_page_text.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/group_home_entity.dart';
import '../widgets/home_widgets/home_group_tile_widget/home_group_tile.dart';
import '../widgets/main_screen_widgets/main_body.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GroupHomeEntity> groupsItems = [
      GroupHomeEntity(
        imageLink:
            'https://images.justwatch.com/poster/248497985/s592/one-piece',
        groupName: 'First year in THIET',
        lastMessage: const TextSpan(
            text:
                'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
        unReadCounter: null,
        isUnread: false,
        lastMessageTime: DateTime.now(),
      ),
      GroupHomeEntity(
        imageLink:
            'https://images.justwatch.com/poster/248497985/s592/one-piece',
        groupName: 'First year in THIET',
        lastMessage: const TextSpan(
            text:
                'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
        unReadCounter: null,
        isUnread: false,
        lastMessageTime: DateTime.now(),
      ),
    ];

    return MainBodyWidget(children: [
      if (groupsItems.isEmpty) EmptyPageText(S.of(context).youCanMakeNewGroups),
      for (GroupHomeEntity e in groupsItems)
        HomeGroupTile(
          onTap: () {},
          onLongPress: () {},
          groupHomeEntity: e,
        ),
    ]);
  }
}
