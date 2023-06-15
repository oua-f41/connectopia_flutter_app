// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable(createFactory: false)
class UserRequest {
  String? id;
  String? userName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? profilePhotoUrl;
  String? about;

  UserRequest(
      {this.id,
      this.userName,
      this.email,
      this.phoneNumber,
      this.fullName,
      this.profilePhotoUrl,
      this.about});

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);

  UserRequest copyWith({
    String? id,
    String? userName,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? profilePhotoUrl,
    String? about,
  }) {
    return UserRequest(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      about: about ?? this.about,
    );
  }
}
