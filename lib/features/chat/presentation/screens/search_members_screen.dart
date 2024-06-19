import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/search_members_cubit/search_members_cubit.dart';
import '../widgets/search_members_widgets/search_members_body.dart';

class SearchMembersScreen extends StatelessWidget {
  const SearchMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchMembersCubit(),
      child: const SearchMembersBody(),
    );
  }
}
