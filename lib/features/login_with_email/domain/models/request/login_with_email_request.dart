import 'package:json_annotation/json_annotation.dart';
part 'login_with_email_request.g.dart';

@JsonSerializable(createFactory: false)
class LoginWithEmailRequest {
  String? email;
  String? password;

  LoginWithEmailRequest({
    this.email,
    this.password,
  });

  LoginWithEmailRequest copyWith({
    String? email,
    String? password,
  }) {
    return LoginWithEmailRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() => _$LoginWithEmailRequestToJson(this);
}
