part of 'change_name_cubit.dart';

sealed class ChangeNameState extends Equatable {
  const ChangeNameState();

  @override
  List<Object> get props => [];
}

final class ChangeNameInitial extends ChangeNameState {
  const ChangeNameInitial();
}

final class ChangeNameLoading extends ChangeNameState {
  const ChangeNameLoading();
}

final class ChangeNameSuccess extends ChangeNameState {
  const ChangeNameSuccess(this.user);
  final AuthUserEntity user;

  @override
  List<Object> get props => [user];
}

final class ChangeNameFailure extends ChangeNameState {
  const ChangeNameFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

final class ChangeNameValidFields extends ChangeNameState {
  const ChangeNameValidFields(this.isValid);
  final bool isValid;

  @override
  List<Object> get props => [isValid];
}
