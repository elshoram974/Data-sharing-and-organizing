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

part 'change_name_state.dart';

class ChangeNameCubit extends Cubit<ChangeNameState> {
  ChangeNameCubit(this.editProfileRepo) : super(const ChangeNameInitial()) {
    List<String> nameParts = user.name.split(" ");
    firstName = nameParts.first.trim();
    lastName = nameParts.sublist(1).join(" ").trim();
  }

  final EditProfileRepositories editProfileRepo;
  final AuthUserEntity user = ProviderDependency.userMain.user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  late String firstName;
  late String lastName;

  Future<void> changeName() async {
    if (!formKey.currentState!.validate()) return;
    EasyLoading.show(dismissOnTap: false);
    emit(const ChangeNameLoading());
    final Status<AuthUserEntity> status =
        await editProfileRepo.changePassword(user.id, firstName, lastName);
    // final Status<AuthUserEntity> status = await editProfileRepo.changeName(user.id, firstName, lastName);
    EasyLoading.dismiss();

    if (status is Success<AuthUserEntity>) {
      emit(ChangeNameSuccess(status.data));
      ProviderDependency.userMain.user = status.data;
      AppRoute.key.currentState!.pop();
      EasyLoading.showSuccess('Name changed');
    } else {
      status as Failure<AuthUserEntity>;
      emit(ChangeNameFailure(status.error));
      EasyLoading.showError(
        status.error,
        duration: const Duration(seconds: 5),
      );
    }
  }

  void onFieldsChange() {
    emit(ChangeNameValidFields(formKey.currentState!.validate()));
  }

  @override
  Future<void> close() {
    focusNode.dispose();
    return super.close();
  }
}
