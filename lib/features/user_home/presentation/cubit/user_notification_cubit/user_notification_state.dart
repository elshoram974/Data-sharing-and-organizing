part of 'user_notification_cubit.dart';

sealed class UserNotificationState extends Equatable {
  const UserNotificationState();

  @override
  List<Object> get props => [];
}

final class UserNotificationInitial extends UserNotificationState {
  const UserNotificationInitial();
}

final class ExpandNotificationState extends UserNotificationState {
  final GroupNotificationEntity groupNotificationEntity;
  const ExpandNotificationState(this.groupNotificationEntity);

  @override
  List<Object> get props => [];
}
