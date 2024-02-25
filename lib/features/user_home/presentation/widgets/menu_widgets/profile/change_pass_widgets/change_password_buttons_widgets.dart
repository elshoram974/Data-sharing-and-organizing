import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_status_enum.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../../../auth/data/models/app_user/user.dart';
import '../../../../../../auth/presentation/widgets/auth_rich_button.dart';

class ChangePasswordButtonsWidget extends StatelessWidget {
  const ChangePasswordButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthRichButton(
          padding: const EdgeInsets.only(top: AppConst.defaultPadding),
          align: TextAlign.start,
          prefixText: S.of(context).forgetPassword,
          buttonText: S.of(context).recover,
          onTap: recover,
        ),
        MyFilledButton(
          text: S.of(context).changePassword,
          onPressed: () {},
        ).verticalPadding(60),
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