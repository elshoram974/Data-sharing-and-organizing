import 'package:data_sharing_organizing/core/status/errors/failure_body.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/group_details_members/group_members_model.dart';
import '../../../data/models/search_member_model/searched_member_model.dart';
import '../../../domain/repositories/group_details_repo.dart';
import '../group_details/group_details_cubit.dart';

part 'search_members_state.dart';

abstract class SearchMembersCubit extends Cubit<SearchMembersState> {
  SearchMembersCubit() : super(const SearchMembersInitial());

  final GroupDetailsCubitImp detailsCubit = ProviderDependency.groupDetails;
  late final GroupDetailsRepositories repo = detailsCubit.groupDetailsRepo;

  List<SearchedMemberModel> currentSearched = [];

  String query = " ";

  void searchMembers();
}

class SearchMembersCubitImp extends SearchMembersCubit {
  SearchMembersCubitImp(){
    searchMembers();
  }

  @override
  void searchMembers() {
    emit(const SearchMembersLoadingState());
    handleStatusEmit<List<SearchedMemberModel>>(
      statusFunction: () => repo.searchMembers(query),
      successFunction: (_) {
        final List<SearchedMemberModel> temp = [];

        outer:
        for (GroupMember e in detailsCubit.members) {
          for (SearchedMemberModel s in _) {
            if (s.userId == e.memberId) continue outer;
          }
          temp.add(
            SearchedMemberModel(
              userId: e.memberId,
              firstName: e.firstName,
              lastName: e.lastName,
              lastLogin: e.lastLogin,
              image: e.image,
            ),
          );
        }

        currentSearched = temp;
        emit(SearchMembersSuccessState(currentSearched));
      },
      failureFunction: (f) => emit(SearchMembersFailureState(f)),
    );
  }
}
