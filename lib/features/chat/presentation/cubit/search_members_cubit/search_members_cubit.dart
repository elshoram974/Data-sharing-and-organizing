import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_members_state.dart';

abstract class SearchMembersCubit extends Cubit<SearchMembersState> {
  SearchMembersCubit() : super(SearchMembersInitial());
}

class SearchMembersCubitImp extends SearchMembersCubit {}
