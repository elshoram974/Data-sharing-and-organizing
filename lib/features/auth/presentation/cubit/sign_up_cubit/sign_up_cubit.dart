import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_role_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
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
  UserRole? userRole;

  final BuildContext? _context = AppRoute.key.currentContext;

  @override
  Future<void> close() {
    focusNode.dispose();
    return super.close();
  }

  void chooseAccountType(UserRole type) {
    userRole = type;
    emit(ChooseAccountTypeState(userRole!));
  }

  // * sign up----------------------------
  void signUp() async {
    if (!formKey.currentState!.validate()) return;
    if (userRole == null) return _chooseAccountTypeDialog();
    formKey.currentState!.save();
    emit(const SignUpLoadingState());
    final AuthUserEntity user = AuthUserEntity(
      name: name,
      email: email,
      password: password,
      userRole: userRole!,
    );
    debugPrint('user: ${user.email} $user');

    final Status<AuthUserEntity> signUpStatus = await signUpUseCase(user);
    if (signUpStatus is Success<AuthUserEntity>) {
      _successLogin(signUpStatus.data);
    } else if (signUpStatus is Failure<AuthUserEntity>) {
      _failureStatus(signUpStatus.error);
    }
  }

  void _successLogin(AuthUserEntity data) {
    emit(SignUpSuccessState(data));

    _context?.push(
      AppRoute.codeVerification,
      extra: AppRoute.home,
    );

    debugPrint('user: ${data.email}');
    TextInput.finishAutofillContext();
  }

  void _failureStatus(String error) async {
    emit(SignUpFailureState(error));

    await ShowMyDialog.error(_context!, body: error);
  }

  // end sign up----------------------------

  void _chooseAccountTypeDialog() async {
    await ShowMyDialog.warning(
      _context!,
      body: S.of(_context).YouHaveChooseTypeOfAccountPersonalOrBusiness,
    );
  }
}
