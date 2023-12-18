import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/auth_user_entity.dart';
import '../../../domain/usecases/verify_code_use_case.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final VerifyCodeUseCase verifyCodeUseCase;

  VerifyCodeCubit(this.verifyCodeUseCase) : super(const VerifyCodeInitial());

    // * verify Code----------------------------
  void verifyCode() async {
    emit(const VerifyCodeLoadingState());
    final Status<AuthUserEntity> verifyStatus = await verifyCodeUseCase(123456);
    if (verifyStatus is Success<AuthUserEntity>) {
      final AuthUserEntity data = verifyStatus.data;
      emit(VerifyCodeSuccessState(data));

      debugPrint('user: ${data.email}');
      //  TODO: Implement verifyCode success
    } else if (verifyStatus is Failure<AuthUserEntity>) {
      final String error = verifyStatus.error;
      emit(VerifyCodeFailureState(error));
      debugPrint('error: $error');
      //  TODO: Implement verifyCode failure
    }
  }
  // end verify Code----------------------------

}
