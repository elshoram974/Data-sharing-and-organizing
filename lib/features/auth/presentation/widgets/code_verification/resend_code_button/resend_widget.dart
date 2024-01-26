import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cubit/verify_code_cubit/verify_code_cubit.dart';
import '../../auth_rich_button.dart';

class ResendWidget extends StatelessWidget {
  const ResendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyCodeCubit cubit = ProviderDependency.verificationCode;

    return BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
      buildWhen: (p, c) =>
          c is VerifyCodeLoadingResendCodeState &&
          c.duration == cubit.waitingTime,
      builder: (context, state) {
        return AuthRichButton(
          prefix: SvgPicture.asset(
            AppAssets.pathArrow,
            fit: BoxFit.contain,
            height: 17,
          ),
          prefixText: S.of(context).noCodeReceived,
          buttonText: S.of(context).resend,
          onTap: cubit.waitingTime == 0 ? ()=> cubit.resendCode() : null,
        );
      },
    );
  }
}
