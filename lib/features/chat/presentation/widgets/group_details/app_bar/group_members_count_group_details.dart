import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/group_details/group_details_cubit.dart';

class GroupMembersCountGroupDetails extends StatelessWidget {
  const GroupMembersCountGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailsCubitImp, GroupDetailsState>(
      builder: (context, state) {
        return Text(
          S.of(context).groupMembersCount(ProviderDependency.groupDetails.members.length),
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika16.copyWith(color: Colors.white),
        );
      },
    );
  }
}
