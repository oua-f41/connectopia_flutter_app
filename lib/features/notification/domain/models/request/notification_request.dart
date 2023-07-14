import 'package:json_annotation/json_annotation.dart';
part 'notification_request.g.dart';

@JsonSerializable()
class NotificationRequest {
  String? body;
  String? title;
  String? id;

  NotificationRequest({this.body, this.title, this.id});

  factory NotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationRequestToJson(this);

  NotificationRequest copyWith({
    String? topic,
    String? body,
    String? title,
    String? route,
    String? id,
  }) {
    return NotificationRequest(
      body: body ?? this.body,
      title: title ?? this.title,
      id: id ?? this.id,
    );
  }
}
