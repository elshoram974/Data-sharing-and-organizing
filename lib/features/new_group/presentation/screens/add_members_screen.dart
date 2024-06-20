import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../../chat/domain/repositories/group_details_repo.dart';
import '../cubit/new_group_cubit.dart';
import '../widgets/add_member/add_members_body.dart';

class AddMembersScreen extends StatelessWidget {
  const AddMembersScreen({super.key, required this.user});

  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewGroupCubit(
        user: user,
        groupDetailsRepo: sl.get<GroupDetailsRepositories>(),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push(AppRoute.addGroupDetails),
          backgroundColor: AppColor.active,
          child: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
        body: const AddMembersBody(),
      ),
    );
  }
}
