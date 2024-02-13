part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

final class ChooseUserRoleState extends SignUpState {
  final UserType userType;
  const ChooseUserRoleState(this.userType);

  @override
  List<UserType> get props => [userType];
}

final class SignUpLoadingState extends SignUpState {
  const SignUpLoadingState();
}

final class SignUpSuccessState extends SignUpState {
  final User user;
  const SignUpSuccessState(this.user);
  @override
  List<User> get props => [user];
}

final class SignUpFailureState extends SignUpState {
  final String error;
  const SignUpFailureState(this.error);
  @override
  List<String> get props => [error];
}
