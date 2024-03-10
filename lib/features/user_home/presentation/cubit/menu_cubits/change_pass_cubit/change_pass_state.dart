part of 'change_pass_cubit.dart';

sealed class ChangePassState extends Equatable {
  const ChangePassState();

  @override
  List<Object> get props => [];
}

final class ChangePassInitial extends ChangePassState {
  const ChangePassInitial();
}

final class ChangePassLoading extends ChangePassState {
  const ChangePassLoading();
}

final class ChangePassSuccess extends ChangePassState {
  const ChangePassSuccess(this.user);
  final AuthUserEntity user;

  @override
  List<Object> get props => [user];
}

final class ChangePassFailure extends ChangePassState {
  const ChangePassFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

final class ChangePassValidFields extends ChangePassState {
  const ChangePassValidFields(this.isValid);
  final bool isValid;

  @override
  List<Object> get props => [isValid];
}
