import 'dart:io';

import 'package:connectopia/product/models/user/request/user_request.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/base_cubit.dart';
import '../../../../app/connectopia_app_cubit.dart';
import '../../../../core/helpers/globals.dart';
import '../../../../core/helpers/image_upload.dart';
import '../../../../product/widgets/info_snack_bar.dart';
import '../../../../product/constants/error_constants.dart';
import '../../../../product/di/injection.dart';
import '../../../../product/helpers/firebase_utilities.dart';
import '../../../../product/models/response_data.dart';
import '../../data/repository/profile_repository.dart';
import '../../domain/models/response/profile_response.dart';
import 'view_model/edit_profile_view_model.dart';

class EditProfileCubit extends BaseCubit<EditProfileViewModel> {
  EditProfileCubit()
      : super(EditProfileViewModel(
          updateProfileFormKey: GlobalKey<FormState>(),
        ));

  final ImageUploadManager _imageUploadManager =
      ImageUploadManager(ImageUploadFromLibary());
  FirebaseStorage store = FirebaseStorage.instance;

  late final IProfileRepository _profileRepository;

  void init(ProfileResponse user) {
    emit(state.copyWith(
        userRequest: UserRequest(
      id: user.id,
      fullName: user.fullName,
      userName: user.userName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      profilePhotoUrl: user.profilePhotoUrl,
      about: user.about,
    )));
    _profileRepository = getIt.get<IProfileRepository>();
  }

  void onFullNameChange({String? firstName, String? lastName}) {
    emit(state.copyWith(
        userRequest: state.userRequest?.copyWith(
            fullName:
                "${firstName ?? state.userRequest?.fullName?.split(" ")[0]} ${lastName ?? state.userRequest?.fullName?.split(" ")[1]}")));
  }

  void onUserNameChange(String userName) {
    emit(state.copyWith(
        userRequest: state.userRequest?.copyWith(userName: userName)));
  }

  void onAboutChange(String about) {
    emit(
        state.copyWith(userRequest: state.userRequest?.copyWith(about: about)));
  }

  void onEmailChange(String email) {
    emit(
        state.copyWith(userRequest: state.userRequest?.copyWith(email: email)));
  }

  void onPhoneNumberChange(String phoneNumber) {
    emit(state.copyWith(
        userRequest: state.userRequest?.copyWith(phoneNumber: phoneNumber)));
  }

  void changeProfilePhoto() async {
    CroppedFile? file = await _imageUploadManager.cropWithFetch();
    saveLocalFile(file);
  }

  void saveLocalFile(CroppedFile? file) {
    if (file == null) return;
    emit(state.copyWith(profilePhoto: File(file.path)));
  }

  Future<void> saveProfilePhoto() async {
    if (state.profilePhoto != null) {
      if (state.userRequest?.profilePhotoUrl.isNotNullOrNoEmpty == true) {
        try {
          await FirebaseStorage.instance
              .ref(FirebaseUtilities.convertFireStoreName(
                  state.userRequest!.profilePhotoUrl!.toString()))
              .delete();
        } catch (e) {
          print(e);
        }
      }
      TaskSnapshot task = await FirebaseStorage.instance
          .ref(state.profilePhoto!.path.split("/").last)
          .putData(await state.profilePhoto!.readAsBytes());

      emit(state.copyWith(
          userRequest: state.userRequest?.copyWith(
              profilePhotoUrl: FirebaseUtilities.convertFireStorePath(
                  task.metadata!.fullPath))));
    }
  }

  Future<bool> updateUser() async {
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: true);
    if (state.updateProfileFormKey.currentState!.validate()) {
      try {
        await saveProfilePhoto();
        ResponseData? response =
            await _profileRepository.updateProfile(state.userRequest!);
        snackbarKey.currentState!
            .showSnackBar(InfoSnackBar(contentText: response?.message ?? ""));
        getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: false);
        return true;
      } catch (e) {
        if (e == ErrorConstants.userAlreadyExists.value) {
          emit(state.copyWith(isExistUserName: true));
        }
        print(e);
      }
    }
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: false);
    return false;
  }
}
