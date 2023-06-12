import 'package:json_annotation/json_annotation.dart';
part 'user_request.g.dart';

@JsonSerializable(createFactory: false)
class UserRequest {
  String? id;
  String? email;
  String? phoneNumber;
  String? fullName;
  String? profilePhotoUrl;

  UserRequest(
      {this.id,
      this.email,
      this.phoneNumber,
      this.fullName,
      this.profilePhotoUrl});

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
