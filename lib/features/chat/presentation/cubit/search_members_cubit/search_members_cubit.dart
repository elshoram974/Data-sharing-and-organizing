import 'dart:async';

import 'package:data_sharing_organizing/core/status/errors/failure_body.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/group_details_members/group_members_model.dart';
import '../../../data/models/search_member_model/searched_user_model.dart';
import '../../../domain/repositories/group_details_repo.dart';
import '../group_details/group_details_cubit.dart';

part 'search_members_state.dart';

abstract class _SearchMembersCubit extends Cubit<SearchMembersState> {
  _SearchMembersCubit() : super(const SearchMembersInitial());

  final GroupDetailsCubitImp detailsCubit = ProviderDependency.groupDetails;
  late final GroupDetailsRepositories repo = detailsCubit.groupDetailsRepo;

  List<SearchedUserModel> currentSearched = [];

  String query = " ";

  void searchMembers();

  void onChangeQuery(String q);
}

class SearchMembersCubit extends _SearchMembersCubit {
  SearchMembersCubit() {
    searchMembers();
  }

  @override
  void searchMembers() {
    emit(const SearchMembersLoadingState());
    handleStatusEmit<List<SearchedUserModel>>(
      dismissLoadingOnTap: null,
      statusFunction: () => repo.searchMembers(query),
      successFunction: (_) {
        final List<SearchedUserModel> temp = _;
        final List<SearchedUserModel> members = [];
        for (GroupMember e in detailsCubit.members) {
          members.add(
            SearchedUserModel(
              userId: e.memberId,
              firstName: e.firstName,
              lastName: e.lastName,
              lastLogin: e.lastLogin,
              image: e.image,
            ),
          );
        }

        temp.removeWhere((e) => e.userId == members[0].userId);

        for (var e in members) {
          if (temp.contains(e)) temp.remove(e);
        }

        currentSearched = temp;
        emit(SearchMembersSuccessState(currentSearched));
      },
      failureFunction: (f) => emit(SearchMembersFailureState(f)),
    );
  }

  Timer? _timer;

  @override
  void onChangeQuery(String q) {
    q = q.trim();
    if (q.trim().isEmpty) q = " ";

    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer.periodic(
      AppConst.durationBeforeSearch,
      (timer) {
        if (query != q) {
          query = q;
          searchMembers();
        }
        timer.cancel();
      },
    );
  }

  @override
  close() {
    _timer?.cancel();
    return super.close();
  }
}
