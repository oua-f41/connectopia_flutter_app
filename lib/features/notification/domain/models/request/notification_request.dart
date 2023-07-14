import 'package:json_annotation/json_annotation.dart';
part 'notification_request.g.dart';

@JsonSerializable()
class NotificationRequest {
  String? topic;
  String? body;
  String? title;
  String? route;
  String? id;

  NotificationRequest({this.topic, this.body, this.title, this.route, this.id});

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
      topic: topic ?? this.topic,
      body: body ?? this.body,
      title: title ?? this.title,
      route: route ?? this.route,
      id: id ?? this.id,
    );
  }
}
