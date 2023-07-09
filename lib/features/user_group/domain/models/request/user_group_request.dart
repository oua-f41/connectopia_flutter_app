// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part 'user_group_request.g.dart';

@JsonSerializable()
class UserGroupRequest {
  String? userId;
  String? groupId;

  UserGroupRequest({this.userId, this.groupId});

  factory UserGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$UserGroupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserGroupRequestToJson(this);

  UserGroupRequest copyWith({
    String? userId,
    String? groupId,
  }) {
    return UserGroupRequest(
      userId: userId ?? this.userId,
      groupId: groupId ?? this.groupId,
    );
  }
}
