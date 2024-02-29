part of 'user_notification_cubit.dart';

sealed class UserNotificationState extends Equatable {
  const UserNotificationState();

  @override
  List<Object> get props => [];
}

final class UserNotificationInitial extends UserNotificationState {}
