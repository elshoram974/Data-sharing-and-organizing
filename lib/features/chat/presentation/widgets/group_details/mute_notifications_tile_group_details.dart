import 'package:data_sharing_organizing/core/shared/switch/custom_switch.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../cubit/group_cubit/group_cubit.dart';
import 'group_details_list_tile.dart';

class MuteNotificationsTileGroupDetails extends StatefulWidget {
  const MuteNotificationsTileGroupDetails({super.key});

  @override
  State<MuteNotificationsTileGroupDetails> createState() =>
      _MuteNotificationsTileGroupDetailsState();
}

class _MuteNotificationsTileGroupDetailsState
    extends State<MuteNotificationsTileGroupDetails> {
  final GroupCubit c = ProviderDependency.group;
  bool isMuted = ProviderDependency.group.group.memberEntity.notification ==
      NotificationEnum.withoutNotify;

  void changeType() {
    NotificationEnum notify = c.group.memberEntity.notification;
    if (notify != NotificationEnum.notify) {
      c.editNotification(NotificationEnum.notify);
    } else {
      c.editNotification(NotificationEnum.withoutNotify);
    }

    isMuted =
        c.group.memberEntity.notification == NotificationEnum.withoutNotify;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: changeType,
      title: S.of(context).muteNotification,
      leading: Icon(
        Icons.notifications_none_outlined,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      trailing: AbstractCustomSwitch(
        value: isMuted,
        onChanged: (_) => changeType(),
      ),
    );
  }
}
