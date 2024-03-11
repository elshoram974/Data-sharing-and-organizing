import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/user_home_cubit/user_home_cubit.dart';
import '../../../widgets/menu_widgets/profile/my_group_widgets/my_groups_app_bar.dart';
import '../../../widgets/menu_widgets/profile/my_group_widgets/user_my_groups_body.dart';


class UserMyGroupsScreen extends StatelessWidget {
  const UserMyGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<UserHomeCubit>(param1: true),
      child: const Scaffold(
        appBar: MyGroupsAppBar(),
        body: UserMyGroupsBody(),
      ),
    );
  }
}
