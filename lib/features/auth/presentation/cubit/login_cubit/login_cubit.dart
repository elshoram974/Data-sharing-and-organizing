import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/auth_user_entity.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginInitialState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool rememberMe = true;

  // * keep login ----------------------------
  void changeRemember() {
    rememberMe = !rememberMe;
    emit(ChangeRememberMeState(rememberMe));
  }
  //  end keep login----------------------------

  // * login----------------------------
  void login() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(const LoginLoadingState());
    final LoginUserEntity user = LoginUserEntity(
      email: email,
      password: password,
      keepLogin: rememberMe,
    );
    final Status<AuthUserEntity> loginState = await loginUseCase(user);
    if (loginState is Success<AuthUserEntity>) {
      final AuthUserEntity data = loginState.data;
      emit(LoginSuccessState(data));
      TextInput.finishAutofillContext();
      AppRoute.key.currentContext?.pushReplacement(AppRoute.home, extra: data);

      debugPrint('user: ${data.email}');
      //  TODO: Implement login success
    } else if (loginState is Failure<AuthUserEntity>) {
      final String error = loginState.error;
      emit(LoginFailureState(error));
      debugPrint('error: $error');
      //  TODO: Implement login failure
    }
  }
  //  end login----------------------------
}
