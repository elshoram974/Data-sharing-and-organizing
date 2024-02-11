import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/group_home_entity.dart';
import '../widgets/home_group_tile_widget/home_group_tile.dart';
import '../widgets/home_user_app_bar.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeUserAppBar(),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 25,
          left: AppConst.defaultPadding,
          right: AppConst.defaultPadding,
          bottom: 56,
        ),
        children: groupsItems,
      ),
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
