import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../widgets/new_group_app_bar.dart';

class AddGroupPermissionsScreen extends StatelessWidget {
  const AddGroupPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          NewGroupAppBar(title: S.of(context).groupPermissions),
        ],
      ),
    );
  }
}
