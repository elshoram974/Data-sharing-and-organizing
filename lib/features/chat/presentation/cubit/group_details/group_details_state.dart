part of 'group_details_cubit.dart';

sealed class GroupDetailsState extends Equatable {
  const GroupDetailsState();

  @override
  List<Object> get props => [];
}

final class GroupDetailsInitial extends GroupDetailsState {
  const GroupDetailsInitial();
}
