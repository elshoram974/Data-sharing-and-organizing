import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
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
  late final FirebaseFirestore db = FirebaseFirestore.instance;
  late DocumentReference<Map<String, dynamic>> dbGroup;
  late CollectionReference<Map<String, dynamic>> dbActivities;
  List<Message> messages = [];

  @override
  void initState() {
    dbGroup = db.collection('Groups').doc(group.groupId.toString());
    dbActivities = dbGroup.collection('activities');
    dbActivities.orderBy('createdAt', descending: true).get().then(
      (querySnapshot) {
        final List<Message> m = querySnapshot.docs
            .map((doc) => Message.fromJson(doc.data()))
            .toList();
        messages = [];
        for (Message e in m) {
          if (e.type != MessageType.text) messages.add(e);
        }
        setState(() {});
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: messages.isEmpty
          ? null
          : () => context.push(AppRoute.groupMedia, extra: messages),
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
                  '${messages.length}',
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
