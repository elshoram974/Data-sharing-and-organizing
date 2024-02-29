import 'package:data_sharing_organizing/core/shared/empty_page_text.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/group_notification_entity.dart';
import '../cubit/user_notification_cubit/user_notification_cubit.dart';
import '../widgets/main_screen_widgets/main_body.dart';
import '../widgets/notification_widgets/notification_tile_widget.dart';

class UserNotificationScreen extends StatelessWidget {
  const UserNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.userNotification = BlocProvider.of<UserNotificationCubit>(context);

    final list = [
      GroupNotificationEntity(
        imageLink:'https://images.justwatch.com/poster/248497985/s592/one-piece',
        groupName: 'First year in THIET aa aa a a a a a a a a a a a a',
        lastMessage: const TextSpan(text:'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
        isUnread: true,
        lastMessageTime: DateTime.now(),
      ),
      GroupNotificationEntity(
        imageLink: '',
        groupName: 'First year in THIET',
        lastMessage: const TextSpan(text:'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
        lastMessageTime: DateTime.now(),
      )
    ];
    return MainBodyWidget(
      children: [
        if (list.isEmpty) EmptyPageText(S.of(context).thereIsNoNotifications),
        for (GroupNotificationEntity e in list)
          NotificationTile(
            onTap: () => print('tapped on ${e.groupName}'),
            onPressExpanded: (isExpanded) => print('is ${e.groupName} Expanded:$isExpanded'),
            groupNotificationEntity: e,
          ),
      ],
    );
  }
}
