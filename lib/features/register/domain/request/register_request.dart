import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? id;
  String? fullName;
  String? userName;

  RegisterRequest({this.id, this.fullName, this.userName});

  RegisterRequest copyWith({
    String? id,
    String? fullName,
    String? userName,
  }) {
    return RegisterRequest(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
