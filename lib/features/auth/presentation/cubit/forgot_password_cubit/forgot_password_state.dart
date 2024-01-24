part of 'forgot_password_cubit.dart';

sealed class CreateNewPasswordState extends Equatable {
  const CreateNewPasswordState();

  @override
  List<Object> get props => [];
}

final class CreateNewPasswordInitial extends CreateNewPasswordState {
  const CreateNewPasswordInitial();
}

final class CreateNewPasswordLoadingState extends CreateNewPasswordState {
  const CreateNewPasswordLoadingState();
}

final class CreateNewPasswordSuccessState extends CreateNewPasswordState {
  final User user;
  const CreateNewPasswordSuccessState(this.user);
  @override
  List<User> get props => [user];
}

final class CreateNewPasswordFailureState extends CreateNewPasswordState {
  final String error;
  const CreateNewPasswordFailureState(this.error);
  @override
  List<String> get props => [error];
}
