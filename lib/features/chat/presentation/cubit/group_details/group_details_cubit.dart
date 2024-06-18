import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'group_details_state.dart';

abstract class GroupDetailsCubit extends Cubit<GroupDetailsState> {
  GroupDetailsCubit() : super(const GroupDetailsInitial());

  Future<void> getMembers();
}

class GroupDetailsCubitImp extends GroupDetailsCubit {
  @override
  Future<void> getMembers() {
    // TODO: implement getMembers
    throw UnimplementedError();
  }
}
