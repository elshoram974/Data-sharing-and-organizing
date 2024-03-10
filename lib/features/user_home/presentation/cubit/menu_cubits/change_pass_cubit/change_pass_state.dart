part of 'change_pass_cubit.dart';

sealed class ChangePassState extends Equatable {
  const ChangePassState();

  @override
  List<Object> get props => [];
}

final class ChangePassInitial extends ChangePassState {
  const ChangePassInitial();
}

final class ChangePassFunctionState extends ChangePassState {
  const ChangePassFunctionState(this.pass, this.newPass);
  final String pass;
  final String newPass;

  @override
  List<Object> get props => [pass, newPass];
}
