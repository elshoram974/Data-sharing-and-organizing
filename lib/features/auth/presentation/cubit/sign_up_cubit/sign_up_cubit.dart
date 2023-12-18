import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/enums/account_type/account_type_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/auth_user_entity.dart';
import '../../../domain/usecases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(const SignUpInitial());

    // * sign up----------------------------
  void signUp() async {
    emit(const SignUpLoadingState());
    const AuthUserEntity user = AuthUserEntity(
      name: '',
      email: '',
      password: '',
      accountType: AccountType.personal,
    );
    final Status<AuthUserEntity> signUpState = await signUpUseCase(user);
    if (signUpState is Success<AuthUserEntity>) {
      final AuthUserEntity data = signUpState.data;
      emit(SignUpSuccessState(data));

      debugPrint('user: ${data.email}');
      //  TODO: Implement signUp success
    } else if (signUpState is Failure<AuthUserEntity>) {
      final String error = signUpState.error;
      emit(SignUpFailureState(error));
      debugPrint('error: $error');
      //  TODO: Implement signUp failure
    }
  }
  // end sign up----------------------------
}
