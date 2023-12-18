part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitialState extends LoginState {
  const LoginInitialState();
}

final class ChangeRememberMeState extends LoginState {
  final bool rememberMe;
  const ChangeRememberMeState(this.rememberMe);

  @override
  List<bool> get props => [rememberMe];
}

final class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

final class LoginSuccessState extends LoginState {
  final AuthUserEntity user;
  const LoginSuccessState(this.user);
  @override
  List<AuthUserEntity> get props => [user];
}

final class LoginFailureState extends LoginState {
  final String error;
  const LoginFailureState(this.error);
  @override
  List<String> get props => [error];
}
