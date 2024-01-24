import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/app_user/user.dart';
import '../../../domain/usecases/recover_account_use_case.dart';

part 'recover_account_state.dart';

class RecoverAccountCubit extends Cubit<RecoverAccountState> {
  final RequestToRecoverAccountUseCase recoverAccountUseCase;

  RecoverAccountCubit(this.recoverAccountUseCase)
      : super(const RecoverAccountInitial());
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  String email = '';

  // * recover account----------------------------

  void recoverAccount() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(const RecoverAccountLoadingState());
    EasyLoading.show(dismissOnTap: false);
    final Status<User> requestStatus = await recoverAccountUseCase(email);
    await EasyLoading.dismiss();
    if (requestStatus is Success<User>) {
      _successStatus(requestStatus.data);
    } else if (requestStatus is Failure<User>) {
      _failureStatus(requestStatus.error);
    }
  }

  void _successStatus(User data) {
    emit(RecoverAccountSuccessState(data));
    AppRoute.key.currentContext!.push(
      AppRoute.codeVerification,
      extra: {'userId': data.id, 'nextRoute': AppRoute.forgotPassword},
    );
  }

  void _failureStatus(String error) {
    emit(RecoverAccountFailureState(error));
    EasyLoading.showError(error, duration: const Duration(seconds: 5));
  }
  // end recover account----------------------------

  void onWillPop() {
    BuildContext context = AppRoute.key.currentContext!;
    formKey.currentState!.save();
    if (email.isNotEmpty) {
      ShowMyDialog.back(
        context,
        body: S.of(context).ifYouReturnNowYouWillLoseAllData,
      );
    } else {
      context.pop();
    }
  }
}
