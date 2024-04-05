import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import 'other_message_widget.dart';
import 'user_message_widget.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.messageCreator});
  final AuthUserEntity messageCreator;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.defaultPadding,
          vertical: 5,
        ),
        child: Visibility(
          visible: messageCreator != ProviderDependency.userMain.user,
          replacement: const UserMessageWidget(
            message: "data data data data data data data data data data ",
          ),
          child: OtherMessageWidget(
            messageCreator: messageCreator,
            message: 'sasasa',
          ),
        ),
      ),
    );
  }
}
