import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_photo_state.dart';

class ChangePhotoCubit extends Cubit<ChangePhotoState> {
  ChangePhotoCubit() : super(ChangePhotoInitial());
  String? imageLink = ProviderDependency.userMain.user.image;
}
