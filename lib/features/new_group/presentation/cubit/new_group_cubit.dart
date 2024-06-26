import 'dart:async';

import 'package:data_sharing_organizing/core/status/errors/failure_body.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/services/pick_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/entities/member_list_tile_entity.dart';
import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../../chat/data/models/search_member_model/searched_user_model.dart';
import '../../../chat/domain/repositories/group_details_repo.dart';
import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/entities/new_group_remote_param.dart';
import '../../domain/repositories/new_group_repositories.dart';

part 'new_group_state.dart';

abstract class _NewGroupCubit extends Cubit<NewGroupState> {
  _NewGroupCubit({
    required this.user,
    required this.repo,
    required this.searchRepo,
  }) : super(const NewGroupInitial());

  final NewGroupRepositories repo;
  final GroupDetailsRepositories searchRepo;
  final AuthUserEntity user;

  late final ScrollController scrollController;

  List<MemberListTileEntity> currentMembers = [];
  List<MemberListTileEntity> selectedMembers = [];

  late GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();
  String newGroupName = '';
  MyFileData? imageData;
  GroupDiscussionType discussionType = GroupDiscussionType.exist;
  GroupAccessType accessType = GroupAccessType.readWriteWithAdminPermission;

  String query = " ";
  Future<void> searchMembers();
  void onChangeQuery(String q);

  void onTapUser(int index);
  void cancelSelected(int index);

  Future<void> changeImage();

  void changeDiscussionType(GroupDiscussionType discussion);
  void changeAccessType(GroupAccessType access);

  void createNewGroup();

  @override
  close();
}

class NewGroupCubit extends _NewGroupCubit {
  NewGroupCubit({
    required super.user,
    required super.repo,
    required super.searchRepo,
  }) {
    searchMembers();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  @override
  Future<void> searchMembers() async {
    emit(SearchMembersLoadingState(_currentPage));
    handleStatusEmit<List<SearchedUserModel>>(
      dismissLoadingOnTap: null,
      statusFunction: () => searchRepo.searchMembers(query, _currentPage),
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

        for (int i = 0; i < temp.length; i++) {
          if (selectedMembers.contains(temp[i])) {
            temp[i] = temp[i].copyWith(isSelected: true);
          }
        }

        if (_currentPage == 1) {
          currentMembers = temp;
        } else {
          currentMembers.addAll(temp);
        }
        emit(SearchMembersSuccessState(currentMembers));
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
  void onTapUser(int index) {
    if (currentMembers[index].isSelected) {
      currentMembers[index] = currentMembers[index].copyWith(isSelected: false);
      selectedMembers.removeWhere((e) => e.id == currentMembers[index].id);
    } else {
      currentMembers[index] = currentMembers[index].copyWith(isSelected: true);
      selectedMembers.add(currentMembers[index]);
    }

    emit(SelectMemberState(currentMembers[index]));
  }

  @override
  void cancelSelected(int index) {
    final MemberListTileEntity temp = selectedMembers.removeAt(index);

    final int i = currentMembers.indexWhere((e) => e.id == temp.id);
    currentMembers[i] = currentMembers[i].copyWith(isSelected: false);

    emit(SelectMemberState(currentMembers[i]));
  }

  @override
  Future<void> changeImage() async {
    imageData = await HandlePickedImage.pickImage(ImageSource.gallery);
    if (imageData == null) return failureStatus(S.current.cancel, () {});
    emit(SelectImageState(imageData?.path));
  }

  @override
  void changeDiscussionType(GroupDiscussionType discussion) {
    discussionType = discussion;
    emit(ChangeGroupDiscussionType(discussionType));
  }

  @override
  void changeAccessType(GroupAccessType access) {
    accessType = access;
    emit(ChangeGroupAccessType(accessType));
  }

  @override
  void createNewGroup() async {
    if (!fieldKey.currentState!.isValid) return;
    final List<int> usersToAdd = [];
    for (MemberListTileEntity e in selectedMembers) {
      usersToAdd.add(e.id);
    }
    final NewGroupRemoteParams params = NewGroupRemoteParams(
      user: user,
      groupName: newGroupName,
      image: imageData,
      accessType: accessType,
      discussionType: discussionType,
      usersToAdd: usersToAdd,
    );
    await handleStatusEmit<GroupHomeEntity>(
      statusFunction: () => repo.createNewGroup(params),
      successFunction: (group) async {
        ProviderDependency.userHome.updateUI();
        final GoRouter router = GoRouter.of(AppRoute.key.currentContext!);
        // Remove the top two pages
        router.pop(); // Pop the last page
        // pushReplacement the new route
        router.pushReplacement(AppRoute.group, extra: group);
      },
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
