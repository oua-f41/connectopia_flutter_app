import 'package:json_annotation/json_annotation.dart';
part 'user_attend_event_request.g.dart';

@JsonSerializable(createFactory: false)
class UserAttendEventRequest {
  UserAttendEventRequest({
    this.eventId,
    this.userId,
  });

  String? eventId;
  String? userId;

  Map<String, dynamic> toJson() => _$UserAttendEventRequestToJson(this);
}
