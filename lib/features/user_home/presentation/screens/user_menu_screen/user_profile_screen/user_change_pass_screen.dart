import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_status_enum.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../auth/data/models/app_user/user.dart';
import '../../../../../auth/presentation/widgets/auth_rich_button.dart';
import '../../../widgets/menu_widgets/profile/change_pass_widgets/password_field.dart';

class UserChangePassScreen extends StatelessWidget {
  const UserChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithTitle(
      title: S.of(context).changePassword,
      bottomPadding: 0.5 * AppConst.defaultPadding,
      children: [
        Form(
          // key: c.formKey,
          child: ResConstrainedBoxAlign(
            child: Column(
              children: [
                Text(
                  S.of(context).yourNewPasswordMustBeDifferentFromPreviously,
                  style: AppStyle.styleRegular15.copyWith(fontSize: 12),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 59),
                PasswordField(
                  hint: S.of(context).currentPassword,
                  newPassword: false,
                  // onChanged: (val) => c.newPassword = val,
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) => c.focusNode.requestFocus(),
                  validator: (val) =>
                      AppValidator.auth(val, 8, 200, FieldType.password),
                ),
                PasswordField(
                  hint: S.of(context).newPassword,
                  newPassword: true,
                  // onChanged: (val) => c.newPassword = val,
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) => c.focusNode.requestFocus(),
                  validator: (val) =>
                      AppValidator.auth(val, 8, 200, FieldType.password),
                ),
                PasswordField(
                  hint: S.of(context).reTypeNewPassword,
                  // focusNode: c.focusNode,
                  newPassword: true,
                  // onFieldSubmitted: (_) => c.saveNewPassword(),
                  // validator: (val) => AppValidator.samePassword(val, c.newPassword),
                ),
                SizedBox(
                  width: double.infinity,
                  child: AuthRichButton(
                    padding:
                        const EdgeInsets.only(top: AppConst.defaultPadding),
                    align: TextAlign.start,
                    prefixText: S.of(context).forgetPassword,
                    buttonText: S.of(context).recover,
                    onTap: recover,
                  ),
                ),
              ],
            ),
          ),
        ).horizontalPadding(AppConst.defaultPadding),
      ],
    );
  }

  void recover() {
    // * requestToSendCodeUseCase first and do it
    /**
                   void recoverAccount() async {
    // emit(const RecoverAccountLoadingState());
    EasyLoading.show(dismissOnTap: false);
    final Status<User> requestStatus = await requestToSendCodeUseCase((
      email: email,
      verification: VerificationType.forgotPassword,
    ));
    await EasyLoading.dismiss();
    if (requestStatus is Success<User>) {
      _successStatus(requestStatus.data);
    } else if (requestStatus is Failure<User>) {
      _failureStatus(requestStatus.error);
    }
  }

  void _successStatus(User data) {
    // emit(RecoverAccountSuccessState(data));
    AppRoute.key.currentContext!.push(
      AppRoute.codeVerification,
      extra: {'user': data, 'nextRoute': AppRoute.forgotPassword},
    );
  }

  void _failureStatus(String error) {
    // emit(RecoverAccountFailureState(error));
    EasyLoading.showError(error, duration: const Duration(seconds: 5));
  }
                   */
    const user = User(
      userId: 1,
      userEmail: 'userEmail',
      userFirstName: 'userFirstName',
      userLastName: 'userLastName',
      userPassword: 'userPassword',
      userType: UserType.personal,
      userStatus: UserStatus.active,
    );
    // dialog or go direct .. i see dialog is better
    ShowMyDialog.verifyDialog(user, AppRoute.forgotPassword);
    // AppRoute.key.currentContext!.push(
    //   AppRoute.codeVerification,
    //   extra: {
    //     'user': user,
    //     'nextRoute': AppRoute.forgotPassword
    //   },
    // );
  }
}
