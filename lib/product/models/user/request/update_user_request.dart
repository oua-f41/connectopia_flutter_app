// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part 'update_user_request.g.dart';

@JsonSerializable(createFactory: false)
class UpdateUserRequest {
  String? userName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? profilePhotoUrl;
  String? about;

  UpdateUserRequest({
    this.userName,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.profilePhotoUrl,
    this.about,
  });

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);

  UpdateUserRequest copyWith({
    String? userName,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? profilePhotoUrl,
    String? about,
  }) {
    return UpdateUserRequest(
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      about: about ?? this.about,
    );
  }
}
