import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequest {
  String? id;

  LoginRequest({this.id});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
