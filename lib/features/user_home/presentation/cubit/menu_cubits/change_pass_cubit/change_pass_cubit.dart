import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../domain/repositories/edit_profile_repositories.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit(this.editProfileRepo) : super(const ChangePassInitial());

  final EditProfileRepositories editProfileRepo;
  final AuthUserEntity user = ProviderDependency.userMain.user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode firstFocus = FocusNode();
  FocusNode secondFocus = FocusNode();
  String oldPass = '';
  String newPass = '';

  Future<void> changePass() async {
    if (!formKey.currentState!.validate()) return;
    EasyLoading.show(dismissOnTap: false);
    emit(const ChangePassLoading());
    final Status<AuthUserEntity> status =
        await editProfileRepo.changePassword(user.id, oldPass, newPass);
    EasyLoading.dismiss();

    if (status is Success<AuthUserEntity>) {
      emit(ChangePassSuccess(status.data));
      AppRoute.key.currentState!.pop();
      EasyLoading.showSuccess('Password changed');
    } else {
      status as Failure<AuthUserEntity>;
      emit(ChangePassFailure(status.error));
      EasyLoading.showError(
        status.error,
        duration: const Duration(seconds: 5),
      );
    }
  }

  void onFieldsChange() {
    emit(ChangePassValidFields(formKey.currentState!.validate()));
  }

  @override
  Future<void> close() {
    firstFocus.dispose();
    secondFocus.dispose();
    return super.close();
  }
}
