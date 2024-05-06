import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'group_details_list_tile.dart';

class MediaDocsTileGroupDetails extends StatelessWidget {
  const MediaDocsTileGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: () {},
      title: S.of(context).mediaAndDocs,
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 100),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter,
                  child: Text('321'),
                ),
              ),
            ),
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
