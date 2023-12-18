part of 'recover_account_cubit.dart';

sealed class RecoverAccountState extends Equatable {
  const RecoverAccountState();

  @override
  List<Object> get props => [];
}

final class RecoverAccountInitial extends RecoverAccountState {
  const RecoverAccountInitial();
}

final class RecoverAccountLoadingState extends RecoverAccountState {
  const RecoverAccountLoadingState();
}

final class RecoverAccountSuccessState extends RecoverAccountState {
  final AuthUserEntity user;
  const RecoverAccountSuccessState(this.user);
  @override
  List<AuthUserEntity> get props => [user];
}

final class RecoverAccountFailureState extends RecoverAccountState {
  final String error;
  const RecoverAccountFailureState(this.error);
  @override
  List<String> get props => [error];
}
