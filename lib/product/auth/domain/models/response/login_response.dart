import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse {
  String? token;
  String? refresh;

  LoginResponse({this.token, this.refresh});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
