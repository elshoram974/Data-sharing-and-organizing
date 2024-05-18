import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/shared/switch/res_my_switch_list_tile.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/services/init_local.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class UserNotificationsSettingsScreen extends StatefulWidget {
  const UserNotificationsSettingsScreen({super.key});

  @override
  State<UserNotificationsSettingsScreen> createState() =>
      _UserNotificationsSettingsScreenState();
}

class _UserNotificationsSettingsScreenState
    extends State<UserNotificationsSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool floatingEnabled = config.get('floatingEnabled') != '0';
    bool lockScreenVisibility = config.get('onLockScreen') == '1';
    bool makeSilent = config.get('makeSilent') == '1';
    bool vibrationEnabled = config.get('vibrationEnabled') == '1';

    return EmptyScreenWithTitle(
      title: S.of(context).notification,
      children: [
        NotificationItemWidget(
          value: makeSilent,
          title: S.of(context).muteNotification,
          onChanged: (val) async {
            await config.put('makeSilent', val ? '1' : '0');
            setState(() {});
          },
        ),
        NotificationItemWidget(
          value: floatingEnabled,
          title: S.of(context).popUps,
          onChanged: makeSilent
              ? null
              : (val) async => await config.put(
                    'floatingEnabled',
                    val ? '1' : '0',
                  ),
        ),
        NotificationItemWidget(
          value: vibrationEnabled,
          title: S.of(context).activateVibration,
          onChanged: makeSilent
              ? null
              : (val) async => await config.put(
                    'vibrationEnabled',
                    val ? '1' : '0',
                  ),
        ),
        NotificationItemWidget(
          value: lockScreenVisibility,
          title: S.of(context).onLockScreen,
          onChanged: (val) async => await config.put(
            'onLockScreen',
            val ? '1' : '0',
          ),
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
    required this.onChanged,
  });

  final bool value;
  final String title;
  final Future<void> Function(bool)? onChanged;

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
      onChanged: widget.onChanged == null
          ? null
          : (value) async {
              await widget.onChanged!(value);
              setState(() {
                this.value = value;
              });
            },
      dense: true,
    ).verticalPadding(22); //30 - 8
  }
}
