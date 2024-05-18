import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/group_notification_entity.dart';
import '../../../domain/repositories/notification_repositories.dart';

part 'user_notification_state.dart';

class UserNotificationCubit extends Cubit<UserNotificationState> {
  final NotificationRepositories repo;
  UserNotificationCubit(this.repo) : super(const UserNotificationInitial()) {
    currentNotifications.addAll(repo.getNotifications());
  }
  final List<GroupNotificationEntity> currentNotifications = [];

  void onPressExpanded(GroupNotificationEntity notification, int i) async {
    GroupNotificationEntity replaced = notification.copyWith(
      isExpanded: !notification.isExpanded,
      isUnread: false,
      unReadCounter: null,
    );
    currentNotifications[i] = await repo.updateNotifications(replaced);
    emit(ExpandNotificationState(currentNotifications[i], i));
  }
}
