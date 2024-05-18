import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/functions/detect_text_direction.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show PlaceholderAlignment;

import '../../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../../../chat/domain/entities/activity_entity.dart';

class HomeGroupLastMessage extends StatelessWidget {
  const HomeGroupLastMessage({
    super.key,
    this.maxLines = 1,
    required this.lastActivity,
  });

  final int? maxLines;
  final ActivityEntity lastActivity;

  @override
  Widget build(BuildContext context) {
    final IconData? icon = lastActivity.type.icon();
    final AuthUserEntity author = lastActivity.createdBy.user;
    return Flexible(
      child: AnimatedSize(
        alignment: Alignment.topCenter,
        duration: const Duration(milliseconds: 300),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: ProviderDependency.userMain.user.id != author.id
                    ? '${author.name}: '
                    : S.of(context).youWithColon,
                style: AppStyle.styleBoldInika24.copyWith(
                  fontSize: 13,
                  color: AppColor.gray,
                ),
              ),
              if (icon != null)
                WidgetSpan(
                  alignment: ui.PlaceholderAlignment.middle,
                  child: Icon(icon, size: 18, color: AppColor.gray),
                ),
              TextSpan(text: lastActivity.content),
            ],
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          textDirection: detectRtlDirectionality(lastActivity.content),
          style: AppStyle.styleBoldInika24.copyWith(
            fontSize: 13,
            color: AppColor.gray,
          ),
        ),
      ),
    );
  }
}
