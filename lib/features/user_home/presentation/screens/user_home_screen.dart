import 'package:flutter/material.dart';

import '../../domain/entities/group_home_entity.dart';
import '../widgets/home_group_tile_widget/home_group_tile.dart';
import '../widgets/main_body.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBodyWidget(children: groupsItems),
    );
  }
}

final List<HomeGroupTile> groupsItems = [
  HomeGroupTile(
    groupHomeEntity: GroupHomeEntity(
      imageLink:
          'https://icon2.cleanpng.com/20180320/hww/kisspng-computer-icons-directory-computer-file-png-transparent-no-5ab134adbd3e51.0821639815215627977751.jpg',
      groupName: 'First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime.now(),
    ),
  ),
  HomeGroupTile(
    groupHomeEntity: GroupHomeEntity(
      imageLink:
          'https://icon2.cleanpng.com/20180320/hww/kisspng-computer-icons-directory-computer-file-png-transparent-no-5ab134adbd3e51.0821639815215627977751.jpg',
      groupName: 'First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ),
  HomeGroupTile(
    groupHomeEntity: GroupHomeEntity(
      imageLink:
          'https://icon2.cleanpng.com/20180320/hww/kisspng-computer-icons-directory-computer-file-png-transparent-no-5ab134adbd3e51.0821639815215627977751.jpg',
      groupName: 'First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ),
  HomeGroupTile(
    groupHomeEntity: GroupHomeEntity(
      imageLink:
          'https://icon2.cleanpng.com/20180320/hww/kisspng-computer-icons-directory-computer-file-png-transparent-no-5ab134adbd3e51.0821639815215627977751.jpg',
      groupName: 'First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime.now().subtract(const Duration(days: 6)),
    ),
  ),
  HomeGroupTile(
    groupHomeEntity: GroupHomeEntity(
      imageLink:
          'https://icon2.cleanpng.com/20180320/hww/kisspng-computer-icons-directory-computer-file-png-transparent-no-5ab134adbd3e51.0821639815215627977751.jpg',
      groupName: 'First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ),
];
