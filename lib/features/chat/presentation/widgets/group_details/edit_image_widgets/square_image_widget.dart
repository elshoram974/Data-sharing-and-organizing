import 'package:data_sharing_organizing/core/shared/image/open_image/open_image.dart';
import 'package:data_sharing_organizing/core/shared/image/person.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/group_details/group_details_cubit.dart';

class SquareImageWidget extends StatelessWidget {
  const SquareImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupDetailsCubitImp c = ProviderDependency.groupDetails;
    final double w = MediaQuery.sizeOf(context).shortestSide;
    return BlocBuilder<GroupDetailsCubitImp, GroupDetailsState>(
      bloc: c,
      builder: (context, state) {
        return Align(
          child: Container(
            height: w,
            width: w,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(AppConst.borderRadius),
            ),
            child: OpenImage(
              imageLink: c.group.imageLink,
              errorWidget: const PersonImage(),
            ),
          ),
        );
      },
    );
  }
}
