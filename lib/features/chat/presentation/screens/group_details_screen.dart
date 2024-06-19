import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/repositories/group_details_repo.dart';
import '../cubit/group_details/group_details_cubit.dart';
import '../widgets/group_details/group_details_body.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupDetailsCubitImp(
        group: group,
        repo: sl.get<GroupDetailsRepositories>(),
      ),
      child: const Scaffold(body: GroupDetailsBody()),
    );
  }
}
