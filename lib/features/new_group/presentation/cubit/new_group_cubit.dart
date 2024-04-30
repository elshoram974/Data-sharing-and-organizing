import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_group_state.dart';

class NewGroupCubit extends Cubit<NewGroupState> {
  NewGroupCubit() : super(NewGroupInitial());
}
