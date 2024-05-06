import 'package:data_sharing_organizing/core/shared/switch/custom_switch.dart';
import 'package:flutter/material.dart';

import 'group_details_list_tile.dart';

class MuteNotificationsTileGroupDetails extends StatelessWidget {
  const MuteNotificationsTileGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: () {},
      title: 'Mute notifications',
      leading: Icon(
        Icons.notifications_none_outlined,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      trailing: AbstractCustomSwitch(
        value: true,
        onChanged: (bool val) {},
      ),
    );
  }
}
