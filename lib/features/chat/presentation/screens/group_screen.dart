import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../../user_home/domain/entities/group_home_entity.dart';
import '../widgets/group_app_bar.dart';
import '../widgets/message_widgets/message_widget.dart';

class UserGroupScreen extends StatelessWidget {
  const UserGroupScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GroupAppBar(group: group),
          Expanded(
            child: CustomScrollView(
              slivers: [
                ...List.generate(
                  20,
                  (index) => MessageWidget(
                    messageCreator: index % 2 == 0
                        ? const AuthUserEntity(
                            id: 20,
                            name: 'name',
                            email: 'email',
                            password: 'password',
                            userType: UserType.personal)
                        : ProviderDependency.userMain.user,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
