import 'package:json_annotation/json_annotation.dart';
part 'create_user_request.g.dart';

@JsonSerializable(createFactory: false)
class CreateUserRequest {
  String? id;
  String? email;
  String? phoneNumber;
  String? fullName;
  String? profilePhotoUrl;

  CreateUserRequest(
      {this.id,
      this.email,
      this.phoneNumber,
      this.fullName,
      this.profilePhotoUrl});

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}
