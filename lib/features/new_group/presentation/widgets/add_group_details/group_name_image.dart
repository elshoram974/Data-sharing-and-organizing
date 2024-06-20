import 'package:data_sharing_organizing/core/shared/group_name_text_field.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/new_group_cubit.dart';

class GroupNameAndImage extends StatelessWidget {
  const GroupNameAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewGroupCubit c = ProviderDependency.newGroup;
    return SliverToBoxAdapter(
      child: ResConstrainedBoxAlign(
        child: Row(
          children: [
            GestureDetector(
              onTap: c.changeImage,
              child: const _NewGroupImage(),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: GroupNameTextField(
                onChanged: (val) => c.newGroupName = val.trim(),
              ),
            ),
          ],
        ),
      ).horizontalPadding(AppConst.defaultPadding),
    );
  }
}

class _NewGroupImage extends StatelessWidget {
  const _NewGroupImage();

  @override
  Widget build(BuildContext context) {
    final NewGroupCubit c = ProviderDependency.newGroup;
    return BlocBuilder<NewGroupCubit, NewGroupState>(
      bloc: c,
      buildWhen: (p, c) => c is SelectImageState,
      builder: (context, state) {
        if (c.imageData != null) {
          return CircleAvatar(
            backgroundColor: AppColor.primary,
            backgroundImage: MemoryImage(c.imageData!.file),
            radius: 21,
          );
        }
        return const CircleAvatar(
          backgroundColor: AppColor.primary,
          radius: 21,
          child: Icon(
            size: 24,
            Icons.camera_alt_rounded,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
