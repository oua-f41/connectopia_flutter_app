import 'package:json_annotation/json_annotation.dart';
part 'user_like_event_request.g.dart';

@JsonSerializable(createFactory: false)
class UserLikeEventRequest {
  String? eventId;
  String? userId;

  UserLikeEventRequest({this.eventId, this.userId});

  Map<String, dynamic> toJson() => _$UserLikeEventRequestToJson(this);
}
