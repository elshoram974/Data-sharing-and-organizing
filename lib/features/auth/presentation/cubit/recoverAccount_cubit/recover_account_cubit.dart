import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/auth_user_entity.dart';
import '../../../domain/usecases/recover_account_use_case.dart';

part 'recover_account_state.dart';

class RecoverAccountCubit extends Cubit<RecoverAccountState> {
  final RequestToRecoverAccountUseCase recoverAccountUseCase;

  RecoverAccountCubit(this.recoverAccountUseCase)
      : super(const RecoverAccountInitial());

  // * recover account----------------------------

  void recoverAccount() async {
    emit(const RecoverAccountLoadingState());
    final Status<AuthUserEntity> requestStatus = await recoverAccountUseCase('email');
    if (requestStatus is Success<AuthUserEntity>) {
      final AuthUserEntity data = requestStatus.data;
      emit(RecoverAccountSuccessState(data));

      debugPrint('user: ${data.email}');
      //  TODO: Implement recoverAccount success
    } else if (requestStatus is Failure<AuthUserEntity>) {
      final String error = requestStatus.error;
      emit(RecoverAccountFailureState(error));
      debugPrint('error: $error');
      //  TODO: Implement recoverAccount failure
    }
  }
  // end recover account----------------------------
}
