import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../../../user_home/presentation/widgets/menu_widgets/settings/settings_tile_widget.dart';
import 'discussion_type_dialog.dart';
import 'discussion_type_name_arrow.dart';

class DiscussionTypeWidget extends StatelessWidget {
  const DiscussionTypeWidget({
    super.key,
    required this.color,
    required this.style,
    required this.group,
  });

  final Color color;
  final TextStyle? style;
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBoxAlign(
      child: SettingsTileWidget<String>(
        color: color,
        style: style,
        icon: AppAssets.groupDiscussionMeeting,
        title: S.of(context).groupDiscussionType,
        onTap: () => showThemeModeDialog(context, group),
        trailing: DiscussionTypeNameAndArrow(group),
      ),
    );
  }

  void showThemeModeDialog(BuildContext context, GroupHomeEntity group) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          child: DiscussionTypeDialog(group: group),
        );
      },
    );
  }
}
