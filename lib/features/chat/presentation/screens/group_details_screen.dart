import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../cubit/group_details/group_details_cubit.dart';
import '../widgets/group_details/group_details_body.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupDetailsCubit(),
      child: Scaffold(
        body: GroupDetailsBody(group: group),
      ),
    );
  }
}
