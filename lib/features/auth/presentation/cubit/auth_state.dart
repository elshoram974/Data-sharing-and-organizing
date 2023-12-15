part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess<T extends Object> extends AuthState {
  final T data;
  const AuthSuccess(this.data);
  @override
  List<T> get props => [data];
}

class AuthFailure extends AuthState {
  final String error;
  const AuthFailure(this.error);
  @override
  List<String> get props => [error];
}
