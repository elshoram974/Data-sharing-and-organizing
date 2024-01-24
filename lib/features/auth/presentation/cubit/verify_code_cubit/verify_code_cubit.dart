import 'dart:async';

import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
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
  final int userId;
  final VerifyCodeUseCase verifyCodeUseCase;
  final RequestToSendCodeUseCase sendCodeUseCase;

  VerifyCodeCubit({
    required this.userId,
    required this.verifyCodeUseCase,
    required this.sendCodeUseCase,
  }) : super(const VerifyCodeInitial()) {
    _start();
  }

  // * verify Code----------------------------
  int code = 0;
  void verifyCode(String nextRoute) async {
    if (code.toString().length < 6) return;
    EasyLoading.show(dismissOnTap: false);

    emit(const VerifyCodeLoadingState());
    final Status<User> verifyStatus = await verifyCodeUseCase((
      id: userId,
      code: code,
    ));
    await EasyLoading.dismiss();
    if (verifyStatus is Success<User>) {
      _verifySuccess(verifyStatus.data, nextRoute);
    } else if (verifyStatus is Failure<User>) {
      _failureState(verifyStatus.error);
    }
  }

  // end verify Code----------------------------

  void _verifySuccess(User user, String nextRoute) {
    _timer.cancel();
    emit(VerifyCodeSuccessState(user));
    if (nextRoute == AppRoute.home) {
      AppRoute.key.currentContext!.go(nextRoute);
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
    final Status<User> status = await sendCodeUseCase.call(userId);
    await EasyLoading.dismiss();
    if (status is Success<User>) {
      _start();
    } else if (status is Failure<User>) {
      _failureState(status.error);
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
