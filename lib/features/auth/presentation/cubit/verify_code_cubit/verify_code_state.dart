part of 'verify_code_cubit.dart';

sealed class VerifyCodeState extends Equatable {
  const VerifyCodeState();

  @override
  List<Object> get props => [];
}

final class VerifyCodeInitial extends VerifyCodeState {
  const VerifyCodeInitial();
}

final class VerifyCodeLoadingState extends VerifyCodeState {
  const VerifyCodeLoadingState();
}

final class VerifyCodeLoadingResendCodeState extends VerifyCodeState {
  final int duration;
  const VerifyCodeLoadingResendCodeState(this.duration);

  @override
  List<int> get props => [duration];
}

final class VerifyCodeSuccessState extends VerifyCodeState {
  final User user;
  const VerifyCodeSuccessState(this.user);
  @override
  List<User> get props => [user];
}

final class VerifyCodeFailureState extends VerifyCodeState {
  final String error;
  const VerifyCodeFailureState(this.error);
  @override
  List<String> get props => [error];
}
