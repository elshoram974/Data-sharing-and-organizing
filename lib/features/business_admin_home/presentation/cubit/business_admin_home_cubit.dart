import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'business_admin_home_state.dart';

class BusinessAdminHomeCubit extends Cubit<BusinessAdminHomeState> {
  BusinessAdminHomeCubit() : super(BusinessAdminHomeInitial());
}
