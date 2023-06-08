import 'package:json_annotation/json_annotation.dart';
part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
  String? id;
  String? name;
  String? email;

  UserRequest({this.id, this.name, this.email});

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
