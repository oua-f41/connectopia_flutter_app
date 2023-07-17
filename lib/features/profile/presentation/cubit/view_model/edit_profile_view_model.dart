import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/presentation/base_view_model.dart';
import '../../../../../product/models/user/request/user_request.dart';

class EditProfileViewModel extends BaseViewModel {
  UserRequest? userRequest;
  GlobalKey<FormState> updateProfileFormKey;
  bool? isExistUserName;
  File? profilePhoto;

  EditProfileViewModel(
      {this.userRequest,
      required this.updateProfileFormKey,
      this.isExistUserName,
      this.profilePhoto});

  EditProfileViewModel copyWith({
    UserRequest? userRequest,
    GlobalKey<FormState>? updateProfileFormKey,
    bool? isExistUserName,
    File? profilePhoto,
  }) {
    return EditProfileViewModel(
      updateProfileFormKey: updateProfileFormKey ?? this.updateProfileFormKey,
      userRequest: userRequest ?? this.userRequest,
      isExistUserName: isExistUserName ?? this.isExistUserName,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  @override
  List<Object?> get props => [
        userRequest,
        updateProfileFormKey,
        isExistUserName,
        profilePhoto,
      ];
}
