import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_photo_state.dart';

class ChangePhotoCubit extends Cubit<ChangePhotoState> {
  ChangePhotoCubit() : super(ChangePhotoInitial());
}
