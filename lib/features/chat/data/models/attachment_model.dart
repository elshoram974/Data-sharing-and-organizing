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
  final double? height; //image

  @HiveField(2)
  final double? width; //image

  @HiveField(3)
  final String? mimeType; //file

  @HiveField(4)
  final String name;

  @HiveField(5)
  final String uri;

  /// [height] and [width] for image and [mimeType] for files

  const AttachmentModel({
    required this.size,
    this.height,
    this.width,
    this.mimeType,
    required this.name,
    required this.uri,
  });

  AttachmentModel copyWith({
    double? size,
    double? height,
    double? width,
    String? mimeType,
    String? name,
    String? uri,
  }) {
    return AttachmentModel(
      size: size ?? this.size,
      name: name ?? this.name,
      uri: uri ?? this.uri,
      height: height ?? this.height,
      width: width ?? this.width,
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
      name: name,
      uri: uri,
      height: height,
      width: width,
      mimeType: mimeType,
    );
  }

  factory AttachmentModel.fromMap(Map<String, dynamic> data) {
    final String uri = data['uri'] as String;
    return AttachmentModel(
      size: data['size'] as double,
      name: data['name'] as String,
      uri: uri,
      height: data['height'] as double?,
      width: data['width'] as double?,
      mimeType: data['mimeType'] as String? ?? lookupMimeType(uri),
    );
  }

  Map<String, dynamic> toMap() => {
        'size': size,
        'name': name,
        'uri': uri,
        'height': height,
        'width': width,
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
  List<Object?> get props => [size, height, width, mimeType, name, uri];
}
