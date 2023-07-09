import 'package:connectopia/product/models/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_like_event_response.g.dart';

@JsonSerializable(createToJson: false)
class UserLikeEventResponse extends BaseResponse {
  String? eventId;
  String? userId;

  UserLikeEventResponse({super.id, this.eventId, this.userId});

  factory UserLikeEventResponse.fromJson(Map<String, dynamic> json) =>
      _$UserLikeEventResponseFromJson(json);
}
