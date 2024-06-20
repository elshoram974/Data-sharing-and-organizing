import 'dart:async';

import 'package:data_sharing_organizing/core/status/errors/failure_body.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';

import '../../../../core/utils/entities/member_list_tile_entity.dart';
import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../../chat/data/models/search_member_model/searched_user_model.dart';
import '../../../chat/domain/repositories/group_details_repo.dart';

part 'new_group_state.dart';

abstract class _NewGroupCubit extends Cubit<NewGroupState> {
  _NewGroupCubit({
    required this.user,
    required this.groupDetailsRepo,
  }) : super(const NewGroupInitial());

  final GroupDetailsRepositories groupDetailsRepo;
  final AuthUserEntity user;

  List<MemberListTileEntity> currentMembers = [];
  List<MemberListTileEntity> selectedMembers = [];

  String query = " ";

  Future<void> searchMembers();

  void onChangeQuery(String q);

  @override
  close();
}

class NewGroupCubit extends _NewGroupCubit {
  NewGroupCubit({
    required super.user,
    required super.groupDetailsRepo,
  }) {
    searchMembers();
  }

  @override
  Future<void> searchMembers() async {
    emit(const SearchMembersLoadingState());
    handleStatusEmit<List<SearchedUserModel>>(
      dismissLoadingOnTap: null,
      statusFunction: () => groupDetailsRepo.searchMembers(query),
      successFunction: (_) {
        for (SearchedUserModel e in _) {
          if (e.userId == user.id) {
            _.remove(e);
            break;
          }
        }

        final List<MemberListTileEntity> temp = [];
        for (SearchedUserModel e in _) {
          temp.add(MemberListTileEntity.fromSearch(e));
        }

        currentMembers = temp;
        emit(SearchMembersSuccessState(currentMembers));
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
