import 'dart:async';

import 'package:data_sharing_organizing/core/status/errors/failure_body.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/group_details_members/group_members_model.dart';
import '../../../data/models/search_member_model/searched_user_model.dart';
import '../../../domain/repositories/group_details_repo.dart';
import '../group_details/group_details_cubit.dart';

part 'search_members_state.dart';

abstract class _SearchMembersCubit extends Cubit<SearchMembersState> {
  _SearchMembersCubit() : super(const SearchMembersInitial());

  final GroupDetailsCubitImp detailsCubit = ProviderDependency.groupDetails;
  late final GroupDetailsRepositories repo = detailsCubit.repo;

  late final ScrollController scrollController;

  List<SearchedUserModel> currentSearched = [];

  String query = " ";

  Future<void> searchMembers();

  void onChangeQuery(String q);

  Future<void> addMember(SearchedUserModel user);

  @override
  close();
}

class SearchMembersCubit extends _SearchMembersCubit {
  SearchMembersCubit() {
    searchMembers();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  @override
  Future<void> searchMembers() async {
    emit(SearchMembersLoadingState(_currentPage));
    handleStatusEmit<List<SearchedUserModel>>(
      dismissLoadingOnTap: null,
      statusFunction: () => repo.searchMembers(query, _currentPage),
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

        if (_currentPage == 1) {
          currentSearched = temp;
        } else {
          currentSearched.addAll(temp);
        }

        emit(SearchMembersSuccessState(currentSearched));
      },
      failureFunction: (f) => emit(SearchMembersFailureState(f)),
    );
  }

  Timer? _timer;

  // * helper functions
  int _currentPage = 1;
  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (state is! SearchMembersLoadingState) {
        _currentPage++;
        searchMembers();
      }
    }
  }

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
          _currentPage = 1;
          searchMembers();
        }
        timer.cancel();
      },
    );
  }

  @override
  Future<void> addMember(SearchedUserModel user) async {
    emit(const AddMemberLoadingState());
    await handleStatusEmit<void>(
      statusFunction: () => repo.addMember(user, detailsCubit.group),
      successFunction: (_) async {
        await detailsCubit.getMembers();
        currentSearched.remove(user);
        emit(AddMemberSuccessState(user));
      },
      failureFunction: (f) => emit(AddMemberFailureState(f)),
    );
  }

  @override
  close() {
    _timer?.cancel();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    return super.close();
  }
}
