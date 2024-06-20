import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:flutter/material.dart';

import '../../../../features/user_home/presentation/widgets/menu_widgets/settings/settings_tile_widget.dart';
import '../name_and_arrow_in_tile.dart';
import 'discussion_type_dialog.dart';

class DiscussionTypeWidget extends StatelessWidget {
  const DiscussionTypeWidget({
    super.key,
    required this.color,
    required this.style,
    required this.discussion,
    required this.onSelect,
  });

  final Color color;
  final TextStyle? style;
  final GroupDiscussionType discussion;
  final void Function(GroupDiscussionType) onSelect;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBoxAlign(
      child: SettingsTileWidget<String>(
        color: color,
        style: style,
        icon: AppAssets.groupDiscussionMeeting,
        title: S.of(context).groupDiscussionType,
        onTap: () => showDiscussionTypeDialog(context, discussion),
        trailing: NameAndArrowInTile(discussion.typeName(context)),
      ),
    );
  }

  void showDiscussionTypeDialog(
      BuildContext context, GroupDiscussionType discussion) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          child: DiscussionTypeDialog(
            value: discussion,
            onSelect: onSelect,
          ),
        );
      },
    );
  }
}
