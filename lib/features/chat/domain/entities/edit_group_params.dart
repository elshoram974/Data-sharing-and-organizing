import 'package:data_sharing_organizing/core/utils/services/pick_image.dart';
import 'package:equatable/equatable.dart';

class EditGroupParams extends Equatable {
  final int adminId;
  final int groupId;
  final String? groupName;
  final MyFileData? groupImage;

  const EditGroupParams({
    required this.adminId,
    required this.groupId,
    required this.groupName,
    required this.groupImage,
  });

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [adminId, groupId, groupName, groupImage];
}
