import 'package:connectopia/product/models/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_attend_event_response.g.dart';

@JsonSerializable(createToJson: false)
class UserAttendEventResponse extends BaseResponse {
  UserAttendEventResponse({
    super.id,
    this.eventId,
    this.userId,
  });

  String? eventId;
  String? userId;

  factory UserAttendEventResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAttendEventResponseFromJson(json);
}
