import 'package:data_sharing_organizing/core/shared/switch/custom_switch.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import 'group_details_list_tile.dart';

class MuteNotificationsTileGroupDetails extends StatelessWidget {
  const MuteNotificationsTileGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: () {},
      title: S.of(context).muteNotification,
      leading: Icon(
        Icons.notifications_none_outlined,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      trailing: AbstractCustomSwitch(
        value: ProviderDependency.group.group.memberEntity.notification == NotificationEnum.withoutNotify,
        onChanged: (bool val) {
          if(val){}
        }, // TODO: change mute in groups
      ),
    );
  }
}
