import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../base_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse {
  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  UserResponse({this.name, this.email, super.id});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
