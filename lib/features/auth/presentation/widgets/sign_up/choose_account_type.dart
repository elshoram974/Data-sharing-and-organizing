import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/account_type_enum.dart';
import 'package:flutter/material.dart';

import 'sign_up_buttons/account_type_widget.dart';

class ChooseAccountType extends StatefulWidget {
  const ChooseAccountType({super.key});

  @override
  State<ChooseAccountType> createState() => _ChooseAccountTypeState();
}

class _ChooseAccountTypeState extends State<ChooseAccountType> {
  AccountType? group;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 2 * AppConst.defaultPadding,
        bottom: AppConst.defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountTypeWidget(
            title: S.of(context).personalAccount,
            group: group,
            value: AccountType.personal,
            onChanged: onChange,
          ),
          Text(
            S.of(context).oR,
            style: const TextStyle(fontSize: 16),
          ),
          AccountTypeWidget(
            title: S.of(context).businessAccount,
            group: group,
            value: AccountType.business,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }

  void onChange(val) {
    group = val;
    setState(() {});
  }
}
