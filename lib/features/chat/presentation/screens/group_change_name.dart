import 'package:data_sharing_organizing/core/shared/group_name_text_field.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../new_group/presentation/widgets/new_group_app_bar.dart';
import '../cubit/group_details/group_details_cubit.dart';
import '../widgets/group_details/edit_name_buttons.dart';

class ChangeGroupNameScreen extends StatelessWidget {
  const ChangeGroupNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupDetailsCubitImp c = ProviderDependency.groupDetails;
    c.newGroupName = c.group.groupName;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewGroupAppBar(title: S.of(context).enterGroupName),
          SliverToBoxAdapter(
            child: ResConstrainedBoxAlign(
              child: SizedBox(
                width: double.maxFinite,
                child: GroupNameTextField(
                  key: c.fieldKey,
                  initialValue: c.newGroupName,
                  onChanged: (val) => c.newGroupName = val.trim(),
                  onEditingComplete: c.changeGroupName,
                ),
              ),
            ).horizontalPadding(AppConst.defaultPadding),
          ),
          const SliverToBoxAdapter(child: EditNameButtons()),
        ],
      ),
    );
  }
}
