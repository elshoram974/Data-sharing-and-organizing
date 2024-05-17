import 'package:data_sharing_organizing/core/utils/enums/notification_type.dart';

class NotificationDataEntity {
  final String title;
  final String message;
  final String topic;
  final NotificationType type;
  Map<String, dynamic> data = {};

  NotificationDataEntity({
    required this.title,
    required this.message,
    required this.topic,
    required this.type,
    required Map<String, dynamic> body,
  }) {
    data['type'] = type.inString;
    data[type.inString] = body;
  }

  // NotificationDataEntity copyWith({
  //   String? title,
  //   String? message,
  //   String? topic,
  //   NotificationType? type,
  //   Map<String, dynamic>? body,
  // }) {
  //   final Map<String, dynamic>? data;

  //   if (body != null) {
  //     data = {};
  //     final String stringType = type?.inString ?? this.type.inString;
  //     data['type'] = stringType;
  //     data[stringType] = body ?? this.data[this.type.inString];
  //   }else{
  //     data = null;
  //   }
  //   return NotificationDataEntity(
  //     title: title ?? this.title,
  //     message: message ?? this.message,
  //     topic: topic ?? this.topic,
  //     type: type ?? this.type,
  //     body: data ?? this.data,
  //   );
  // }
}
