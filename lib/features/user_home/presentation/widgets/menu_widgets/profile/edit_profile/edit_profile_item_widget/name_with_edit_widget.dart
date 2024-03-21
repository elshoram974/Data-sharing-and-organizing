import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NameWithEditButtonWidget extends StatelessWidget {
  const NameWithEditButtonWidget({
    super.key,
    required this.textBody,
    required this.onPressEdit,
  });

  final String textBody;
  final void Function()? onPressEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 42),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  textBody,
                  style: AppStyle.styleBoldInika24
                      .copyWith(color: AppColor.primary),
                ),
              ),
              IconButton(
                tooltip: onPressEdit == null ? null : S.of(context).edit,
                onPressed: onPressEdit,
                color: AppColor.primary,
                disabledColor: AppColor.secondary,
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
