import 'package:data_sharing_organizing/core/shared/default_field.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../cubit/bot_cubit/directories_cubit/directories_cubit.dart';

class AddActivityWidget extends StatelessWidget {
  const AddActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DirectoryCubit c = ProviderDependency.directory;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(S.of(context).addActivityMessageImageOrFile),
        const SizedBox(height: AppConst.defaultPadding),
        MyDefaultField(
          fieldKey: c.activityKey,
          onChanged: c.onChangeAct,
          validator: (val) => AppValidator.auth(val, 3, 500, FieldType.other),
        ),
      ],
    );
  }
}
