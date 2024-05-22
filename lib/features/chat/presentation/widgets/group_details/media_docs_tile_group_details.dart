import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import 'group_details_list_tile.dart';

class MediaDocsTileGroupDetails extends StatefulWidget {
  const MediaDocsTileGroupDetails({super.key});

  @override
  State<MediaDocsTileGroupDetails> createState() =>
      _MediaDocsTileGroupDetailsState();
}

class _MediaDocsTileGroupDetailsState extends State<MediaDocsTileGroupDetails> {
  final GroupHomeEntity group = ProviderDependency.group.group;
  late final Reference _storageRef = FirebaseStorage.instance.ref();
  late final String filesPath = "${group.groupId}/files";
  late final Reference filesRef = _storageRef.child(filesPath);
  ListResult? result;

  @override
  void initState() {
    filesRef.listAll().then((val) => setState(() => result = val));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: result == null
          ? null
          : () => context.push(AppRoute.groupMedia, extra: result),
      title: S.of(context).mediaAndDocs,
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 100),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topCenter,
                child: Text(
                  '${result?.items.length ?? 0}',
                  style: AppStyle.styleBoldInika16,
                ),
              ),
            ),
            const SizedBox(width: 0.5 * AppConst.defaultPadding),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ],
        ),
      ),
    );
  }
}
