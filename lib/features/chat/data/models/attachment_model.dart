import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:mime/mime.dart';
import 'package:hive/hive.dart';


part 'attachment_model.g.dart';

@HiveType(typeId: 10)
class AttachmentModel extends Equatable {
  @HiveField(0)
  final double size;

  @HiveField(1)
  final String? mimeType; //file

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String uri;

  @HiveField(4)
  final List<int> file;

  /// [height] and [width] for image and [mimeType] for files

  const AttachmentModel({
    required this.size,
    required this.file,
    this.mimeType,
    required this.name,
    required this.uri,
  });

  AttachmentModel copyWith({
    double? size,
    List<int>? file,
    double? height,
    double? width,
    String? mimeType,
    String? name,
    String? uri,
  }) {
    return AttachmentModel(
      size: size ?? this.size,
      file: file ?? this.file,
      name: name ?? this.name,
      uri: uri ?? this.uri,
      mimeType: mimeType ?? this.mimeType,
    );
  }

  AttachmentModel copyWithNull({
    required double? height,
    required double? width,
    required String? mimeType,
  }) {
    return AttachmentModel(
      size: size,
      file: file,
      name: name,
      uri: uri,
      mimeType: mimeType,
    );
  }

  factory AttachmentModel.fromMap(Map<String, dynamic> data) {
    final String uri = data['uri'] as String;
    return AttachmentModel(
      size: data['size'] as double,
      name: data['name'] as String,
      file: data['file'] as List<int>,
      uri: uri,
      mimeType: data['mimeType'] as String? ?? lookupMimeType(uri),
    );
  }

  Map<String, dynamic> toMap() => {
        'size': size,
        'name': name,
        'file':file,
        'uri': uri,
        'mimeType': mimeType ?? lookupMimeType(uri),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AttachmentModel].
  factory AttachmentModel.fromJson(String data) {
    return AttachmentModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AttachmentModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [size,file, mimeType, name, uri];
}
