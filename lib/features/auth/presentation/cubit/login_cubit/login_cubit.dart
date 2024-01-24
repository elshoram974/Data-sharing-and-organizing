import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/app_user/user.dart';
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
    EasyLoading.show(dismissOnTap: false);

    final LoginUserEntity user = LoginUserEntity(
      email: email,
      password: password,
      keepLogin: rememberMe,
    );
    final Status<User> loginState = await loginUseCase((provider: UserProvider.emailPassword, user: user));
    await EasyLoading.dismiss();
    if (loginState is Success<User>) {
      final User data = loginState.data;
      await _inSuccess(data);
    } else if (loginState is Failure<User>) {
      final String error = loginState.error;
      _inFailure(error);
    }
  }

  void _inFailure(String error) {
    emit(LoginFailureState(error));
    EasyLoading.showError(error, duration: const Duration(seconds: 5));
  }

  Future<void> _inSuccess(User data) async {
    emit(LoginSuccessState(data));
    TextInput.finishAutofillContext();
    if (data.userIsVerified) {
      EasyLoading.showSuccess(data.name, duration: const Duration(seconds: 2));
      AppRoute.key.currentContext?.pushReplacement(AppRoute.home, extra: data);
    } else {
      await ShowMyDialog.verifyDialog(data.userId);
    }
  }
  //  end login----------------------------

  void socialLogin(UserProvider provider) async {
    emit(const LoginLoadingState());
    EasyLoading.show(dismissOnTap: false);
    final LoginUserEntity user = LoginUserEntity(
      email: email,
      password: password,
      keepLogin: rememberMe,
    );

    final Status<User> loginState = await loginUseCase((provider: provider, user: user));
    await EasyLoading.dismiss();
    if (loginState is Success<User>) {
      final User data = loginState.data;
      await _inSuccess(data);
    } else if (loginState is Failure<User>) {
      final String error = loginState.error;
      _inFailure(error);
    }
  }
}
