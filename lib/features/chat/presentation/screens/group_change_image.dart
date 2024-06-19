import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import '../../../new_group/presentation/widgets/new_group_app_bar.dart';
import '../widgets/group_details/edit_image_widgets/change_group_image_button.dart';
import '../widgets/group_details/edit_image_widgets/square_image_widget.dart';

class ChangeGroupImageScreen extends StatelessWidget {
  const ChangeGroupImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewGroupAppBar(
            title: S.of(context).groupPhoto,
            actions: const [ChangeGroupImageButton()],
          ),
          SliverToBoxAdapter(
            child: const ResConstrainedBoxAlign(
              child: SizedBox(
                width: double.maxFinite,
                child: SquareImageWidget(),
              ),
            ).horizontalPadding(AppConst.defaultPadding),
          ),
        ],
      ),
    );
  }
}
