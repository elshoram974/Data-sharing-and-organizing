import 'dart:async';

import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/verification_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:data_sharing_organizing/features/auth/domain/usecases/request_to_send_code_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/app_user/user.dart';
import '../../../domain/usecases/verify_code_use_case.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final User user;
  final String nextRoute;
  final VerifyCodeUseCase verifyCodeUseCase;
  final RequestToSendCodeUseCase sendCodeUseCase;

  VerifyCodeCubit({
    required this.user,
    required this.nextRoute,
    required this.verifyCodeUseCase,
    required this.sendCodeUseCase,
  }) : super(const VerifyCodeInitial()) {
    _start();
  }

  VerificationType verificationFromNextRoute() {
    if (nextRoute == AppRoute.userHome) return VerificationType.createEmail;
    return VerificationType.forgotPassword;
  }

  // * verify Code----------------------------
  String code = '';
  void verifyCode() async {
    if (code.length < 6) return;
    EasyLoading.show(dismissOnTap: false);

    emit(const VerifyCodeLoadingState());
    final Status<User> verifyStatus = await verifyCodeUseCase((
      id: user.userId,
      code: code,
      verification: verificationFromNextRoute(),
    ));
    await EasyLoading.dismiss();
    if (verifyStatus is Success<User>) {
      _verifySuccess(verifyStatus.data, nextRoute);
    } else if (verifyStatus is Failure<User>) {
      _failureState(verifyStatus.failure.message);
    }
  }

  // end verify Code----------------------------

  void _verifySuccess(User user, String nextRoute) {
    _timer.cancel();
    emit(VerifyCodeSuccessState(user));
    if (nextRoute == AppRoute.userHome) {
      if (user.userType == UserType.business) {
        // TODO: to admin home
      } else {
        AppRoute.key.currentContext!.go(AppRoute.userHome, extra: user);
      }
    } else {
      AppRoute.key.currentContext!.pushReplacement(nextRoute, extra: user.id);
    }
  }

  void _failureState(String error) {
    emit(VerifyCodeFailureState(error));
    EasyLoading.showError(error, duration: const Duration(seconds: 5));
  }

  // * resend Code----------------------------
  late Timer _timer;
  late int waitingTime;
  void resendCode() async {
    emit(const VerifyCodeLoadingState());
    EasyLoading.show(dismissOnTap: false);
    final Status<User> status = await sendCodeUseCase.call((
      email: user.email,
      verification: verificationFromNextRoute(),
    ));
    await EasyLoading.dismiss();
    if (status is Success<User>) {
      _start();
    } else if (status is Failure<User>) {
      _failureState(status.failure.message);
    }
  }

  void _start() {
    waitingTime = 90;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        waitingTime--;
        emit(VerifyCodeLoadingResendCodeState(waitingTime));
        if (waitingTime <= 0) timer.cancel();
      },
    );
  }

  // end resend Code----------------------------
  void onWillPop() {
    ShowMyDialog.back(
      AppRoute.key.currentContext!,
      onGoBack: _timer.cancel,
    );
  }
}
