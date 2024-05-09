import 'package:flutter/material.dart';

import '../../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../../../user_home/presentation/widgets/menu_widgets/settings/name_arrow_widget.dart';

class DiscussionTypeNameAndArrow extends StatelessWidget {
  const DiscussionTypeNameAndArrow(this.group, {super.key});
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth / 3,
          child: NameAndArrowWidget(
            name: group.discussion.typeName(context),
          ),
        );
      },
    );
    // return BlocBuilder<ConfigCubit, ConfigState>(
    //   buildWhen: (previous, current) => current is ChangeThemeMode,
    //   builder: (context, state) {
    //     return NameAndArrowWidget(name: themeName(cubit.themeMode, context));
    //   },
    // );
  }
}
