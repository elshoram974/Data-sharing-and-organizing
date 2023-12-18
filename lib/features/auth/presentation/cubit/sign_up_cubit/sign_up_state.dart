part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

final class SignUpLoadingState extends SignUpState {
  const SignUpLoadingState();
}

final class SignUpSuccessState extends SignUpState {
  final AuthUserEntity user;
  const SignUpSuccessState(this.user);
  @override
  List<AuthUserEntity> get props => [user];
}

final class SignUpFailureState extends SignUpState {
  final String error;
  const SignUpFailureState(this.error);
  @override
  List<String> get props => [error];
}
