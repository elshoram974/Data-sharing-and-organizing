import 'package:data_sharing_organizing/core/shared/empty_page_text.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/user_home/domain/entities/group_notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/user_notification_cubit/user_notification_cubit.dart';
import '../widgets/main_screen_widgets/main_body.dart';
import '../widgets/notification_widgets/notification_tile_widget.dart';

class UserNotificationScreen extends StatelessWidget {
  const UserNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserNotificationCubit c = ProviderDependency.userNotification =
        BlocProvider.of<UserNotificationCubit>(context);

    return BlocBuilder<UserNotificationCubit, UserNotificationState>(
      builder: (context, state) {
        return MainBodyWidget(
          children: [
            if (c.currentNotifications.isEmpty)
              EmptyPageText(S.of(context).thereIsNoNotifications),
            ...List.generate(
              c.currentNotifications.length,
              (i) {
                final GroupNotificationEntity notification =
                    c.currentNotifications[i];
                return NotificationTile(
                  onPressExpanded: (isExpanded) =>
                      c.onPressExpanded(notification, i),
                  groupNotificationEntity: notification,
                  onTap: () {
                    context.push(AppRoute.group, extra: notification);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
