import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/shared/switch/res_my_switch_list_tile.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class UserNotificationsSettingsScreen extends StatelessWidget {
  const UserNotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool showInStatusBar = false;
    bool showOnLockScreen = false;
    bool showPopUps = true;
    return EmptyScreenWithTitle(
      title: S.of(context).notification,
      children: [
        NotificationItemWidget(
          value: showInStatusBar,
          title: S.of(context).statusBar,
        ),
        NotificationItemWidget(
          value: showOnLockScreen,
          title: S.of(context).onLockScreen,
        ),
        NotificationItemWidget(
          value: showPopUps,
          title: S.of(context).popUps,
        ),
      ],
    );
  }
}

class NotificationItemWidget extends StatefulWidget {
  const NotificationItemWidget({
    super.key,
    required this.value,
    required this.title,
  });

  final bool value;
  final String title;

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  late bool value = widget.value;
  @override
  Widget build(BuildContext context) {
    return ResMySwitchListTile(
      title: Text(
        widget.title,
        style: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
      ),
      value: value,
      onChanged: (value) => setState(() => this.value = value),
      dense: true,
    ).verticalPadding(22); //30 - 8
  }
}
