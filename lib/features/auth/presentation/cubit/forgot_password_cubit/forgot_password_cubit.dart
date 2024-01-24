import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/app_user/user.dart';
import '../../../domain/usecases/new_password_use_case.dart';

part 'forgot_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  final int userId;
  final NewPasswordUseCase createNewPasswordUseCase;

  CreateNewPasswordCubit({
    required this.userId,
    required this.createNewPasswordUseCase,
  }) : super(const CreateNewPasswordInitial()) {
    focusNode = FocusNode();
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final FocusNode focusNode;
  String newPassword = '';

  @override
  Future<void> close() {
    focusNode.dispose();
    return super.close();
  }

  // * save new password----------------------------
  void saveNewPassword() async {
    if (!formKey.currentState!.validate()) return;

    emit(const CreateNewPasswordLoadingState());

    EasyLoading.show(dismissOnTap: false);

    final Status<User> savedStatus = await createNewPasswordUseCase((
      id: userId,
      newPass: newPassword,
    ));
    await EasyLoading.dismiss();
    if (savedStatus is Success<User>) {
      _savedSuccess(savedStatus.data);
    } else if (savedStatus is Failure<User>) {
      _failureState(savedStatus.error);
    }
  }

  // end saved new password Code----------------------------

  void _savedSuccess(User user) {
    emit(CreateNewPasswordSuccessState(user));
    TextInput.finishAutofillContext();
    AppRoute.key.currentContext!.go(AppRoute.home);
  }

  void _failureState(String error) {
    emit(CreateNewPasswordFailureState(error));
    EasyLoading.showError(error, duration: const Duration(seconds: 5));
  }

  void onWillPop() {
    ShowMyDialog.back(AppRoute.key.currentContext!);
  }
}
