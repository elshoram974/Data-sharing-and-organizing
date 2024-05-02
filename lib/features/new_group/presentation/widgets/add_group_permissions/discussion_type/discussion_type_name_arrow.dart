import 'package:flutter/material.dart';

import '../../../../../user_home/presentation/widgets/menu_widgets/settings/name_arrow_widget.dart';


class DiscussionTypeNameAndArrow extends StatelessWidget {
  const DiscussionTypeNameAndArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return NameAndArrowWidget(name: 'name');
    // return BlocBuilder<ConfigCubit, ConfigState>(
    //   buildWhen: (previous, current) => current is ChangeThemeMode,
    //   builder: (context, state) {
    //     return NameAndArrowWidget(name: themeName(cubit.themeMode, context));
    //   },
    // );
  }
}
