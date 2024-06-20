import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'activity_model.dart';
import 'directory_model.dart';

class DirActivitiesBot extends Equatable {
  final String status;
  final List<ActivityModel> activities;
  final List<DirectoryModel> directories;

  const DirActivitiesBot({
    required this.status,
    required this.activities,
    required this.directories,
  });

  factory DirActivitiesBot.fromMap(Map<String, dynamic> data) {
    return DirActivitiesBot(
      status: data['status'] as String,
      activities: (data['activities'] as List<dynamic>?)
              ?.map((e) => ActivityModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
      directories: (data['directions'] as List<dynamic>?)
              ?.map((e) => DirectoryModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'activities': activities.map((e) => e.toMap()).toList(),
        'directions': directories.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DirActivitiesBot].
  factory DirActivitiesBot.fromJson(String data) {
    return DirActivitiesBot.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DirActivitiesBot] to a JSON string.
  String toJson() => json.encode(toMap());

  DirActivitiesBot copyWith({
    String? status,
    List<ActivityModel>? activities,
    List<DirectoryModel>? directories,
  }) {
    return DirActivitiesBot(
      status: status ?? this.status,
      activities: activities ?? this.activities,
      directories: directories ?? this.directories,
    );
  }

  @override
  List<Object?> get props => [status, activities, directories];
}
