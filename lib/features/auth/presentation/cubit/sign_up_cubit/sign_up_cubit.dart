import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/account_type/account_type_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/auth_user_entity.dart';
import '../../../domain/usecases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(const SignUpInitial()) {
    focusNode = FocusNode();
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final FocusNode focusNode;

  String name = '';
  String email = '';
  String password = '';
  AccountType? accountType;

  @override
  Future<void> close() {
    focusNode.dispose();
    return super.close();
  }

  void chooseAccountType(AccountType type) {
    accountType = type;
    emit(ChooseAccountTypeState(accountType!));
  }

  // * sign up----------------------------
  void signUp() async {
    if (!formKey.currentState!.validate()) return;
    if (accountType == null) return;
    formKey.currentState!.save();
    emit(const SignUpLoadingState());
    final AuthUserEntity user = AuthUserEntity(
      name: name,
      email: email,
      password: password,
      accountType: accountType!,
    );
    debugPrint('user: ${user.email} $user');

    final Status<AuthUserEntity> signUpState = await signUpUseCase(user);
    if (signUpState is Success<AuthUserEntity>) {
      final AuthUserEntity data = signUpState.data;
      emit(SignUpSuccessState(data));

      AppRoute.key.currentContext?.push(
        AppRoute.codeVerification,
        extra: AppRoute.home,
      );

      debugPrint('user: ${data.email}');
      TextInput.finishAutofillContext();
    } else if (signUpState is Failure<AuthUserEntity>) {
      final String error = signUpState.error;
      emit(SignUpFailureState(error));
      debugPrint('error: $error');
      //  TODO: Implement signUp failure
    }
  }
  // end sign up----------------------------
}
