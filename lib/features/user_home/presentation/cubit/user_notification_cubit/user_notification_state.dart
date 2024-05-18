part of 'user_notification_cubit.dart';

sealed class UserNotificationState extends Equatable {
  const UserNotificationState();

  @override
  List<Object> get props => [];
}

final class UserNotificationInitial extends UserNotificationState {
  const UserNotificationInitial();
}

final class UpdateNotificationState extends UserNotificationState {
  final GroupNotificationEntity groupNotificationEntity;
  final int index;
  const UpdateNotificationState(this.groupNotificationEntity, this.index);

  @override
  List<Object> get props => [groupNotificationEntity, index];
}
