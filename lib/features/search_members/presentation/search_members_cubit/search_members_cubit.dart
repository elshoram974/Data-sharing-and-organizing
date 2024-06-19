import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../chat/presentation/cubit/search_members_cubit/search_members_cubit.dart';


abstract class SearchMembersCubit extends Cubit<SearchMembersState> {
  SearchMembersCubit() : super(SearchMembersInitial());
}

class SearchMembersCubitImp extends SearchMembersCubit {}
