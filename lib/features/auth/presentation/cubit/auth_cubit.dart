import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/enums/account_type/account_type_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/usecases/log_out_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/recover_account_use_case.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import '../../domain/usecases/verify_code_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final RequestToRecoverAccountUseCase recoverAccountUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  final LogOutUseCase logOutUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.recoverAccountUseCase,
    required this.verifyCodeUseCase,
    required this.logOutUseCase,
  }) : super(const AuthInitial());

  void login() async {
    emit(const AuthLoading());
    const LoginUserEntity user = LoginUserEntity(email: '', password: '');
    final Status<AuthUserEntity> loginState = await loginUseCase(user);
    if (loginState is Success<AuthUserEntity>) {
      final AuthUserEntity data = loginState.data;
      emit(AuthSuccess<AuthUserEntity>(data));

      debugPrint('user: ${data.email}');
      //  TODO: Implement login success
    } else if (loginState is Failure<AuthUserEntity>) {
      final String error = loginState.error;
      emit(AuthFailure(error));
      debugPrint('error: $error');
      //  TODO: Implement login failure
    }
  }

  void signUp() async {
    emit(const AuthLoading());
    const AuthUserEntity user = AuthUserEntity(
      name: '',
      email: '',
      password: '',
      accountType: AccountType.personal,
    );
    final Status<AuthUserEntity> signUpState = await signUpUseCase(user);
    if (signUpState is Success<AuthUserEntity>) {
      final AuthUserEntity data = signUpState.data;
      emit(AuthSuccess<AuthUserEntity>(data));

      debugPrint('user: ${data.email}');
      //  TODO: Implement signUp success
    } else if (signUpState is Failure<AuthUserEntity>) {
      final String error = signUpState.error;
      emit(AuthFailure(error));
      debugPrint('error: $error');
      //  TODO: Implement signUp failure
    }
  }

  void recoverAccount() async {
    emit(const AuthLoading());
    final Status<AuthUserEntity> requestStatus =
        await recoverAccountUseCase('email');
    if (requestStatus is Success<AuthUserEntity>) {
      final AuthUserEntity data = requestStatus.data;
      emit(AuthSuccess<AuthUserEntity>(data));

      debugPrint('user: ${data.email}');
      //  TODO: Implement recoverAccount success
    } else if (requestStatus is Failure<AuthUserEntity>) {
      final String error = requestStatus.error;
      emit(AuthFailure(error));
      debugPrint('error: $error');
      //  TODO: Implement recoverAccount failure
    }
  }

  void verifyCode() async {
    emit(const AuthLoading());
    final Status<AuthUserEntity> verifyStatus = await verifyCodeUseCase(123456);
    if (verifyStatus is Success<AuthUserEntity>) {
      final AuthUserEntity data = verifyStatus.data;
      emit(AuthSuccess<AuthUserEntity>(data));

      debugPrint('user: ${data.email}');
      //  TODO: Implement verifyCode success
    } else if (verifyStatus is Failure<AuthUserEntity>) {
      final String error = verifyStatus.error;
      emit(AuthFailure(error));
      debugPrint('error: $error');
      //  TODO: Implement verifyCode failure
    }
  }

  void logOut() async {
    emit(const AuthLoading());
    final Status<int> logOutStatus = await logOutUseCase();
    if (logOutStatus is Success<int>) {
      final int data = logOutStatus.data;
      emit(AuthSuccess<int>(data));

      debugPrint('user: $data');
      //  TODO: Implement logOut success
    } else if (logOutStatus is Failure<int>) {
      final String error = logOutStatus.error;
      emit(AuthFailure(error));
      debugPrint('error: $error');
      //  TODO: Implement logOut failure
    }
  }
}
