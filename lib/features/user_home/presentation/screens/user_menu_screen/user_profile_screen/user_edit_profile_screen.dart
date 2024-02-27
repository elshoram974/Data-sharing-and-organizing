import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/shared/image/person.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter/material.dart';

import '../../../widgets/circular_image_widget.dart';
import '../../../widgets/menu_widgets/profile/edit_profile/edit_profile_item_widget/edit_profile_item_widget.dart';
import '../../../widgets/menu_widgets/profile/edit_profile/save_button_widget.dart';

class UserEditProfileScreen extends StatelessWidget {
  const UserEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthUserEntity user = ProviderDependency.config.currentUser!;
    return EmptyScreenWithTitle(
      actions: const [SaveButtonWidget()],
      title: S.of(context).editProfile,
      children: [
        Align(
          child: CircularImageWidget(
            imageLink: user.image,
            dimension: 210,
            errorWidget: const PersonImage(),
          ),
        ),
        const SizedBox(height: 20),
        EditProfileItemWidget(
          label: S.of(context).name,
          icon: Icons.person,
          textBody: user.name,
          onPressEdit: () {},
        ),
        EditProfileItemWidget(
          label: S.of(context).email,
          icon: Icons.alternate_email_outlined,
          textBody: user.email,
        ),
        EditProfileItemWidget(
          showDivider: false,
          label: S.of(context).type,
          icon: Icons.person_outline,
          textBody: user.userType.name(context),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
