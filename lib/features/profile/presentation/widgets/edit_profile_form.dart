import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constants/image_constants.dart';
import '../cubit/edit_profile_cubit.dart';
import '../cubit/view_model/edit_profile_view_model.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileViewModel>(
      builder: (context, state) {
        return Form(
          key: state.updateProfileFormKey,
          child: Column(
            children: [
              Container(
                margin: context.onlyBottomPaddingMedium,
                height: 205,
                child: Stack(
                  children: [
                    Container(
                        height: 135,
                        color: context.colorScheme.primaryContainer),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          context.read<EditProfileCubit>().changeProfilePhoto();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: context.colorScheme.background,
                              border: Border.all(
                                  color: context.colorScheme.background,
                                  width: 1),
                              shape: BoxShape.circle),
                          padding: context.paddingLow,
                          height: 140,
                          width: 140,
                          child: ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: state.profilePhoto != null
                                ? Image.file(
                                    state.profilePhoto!,
                                    fit: BoxFit.cover,
                                  )
                                : state.userRequest?.profilePhotoUrl
                                            .isNotNullOrNoEmpty ==
                                        true
                                    ? Image.network(
                                        state.userRequest!.profilePhotoUrl!,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        ImageConstants
                                            .defaultProfilePhoto.imagePath,
                                        fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: context.verticalPaddingLow,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: context.onlyLeftPaddingMedium,
                      width: context.dynamicWidth(0.48),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your first name";
                          }
                          return null;
                        },
                        initialValue: state
                                    .userRequest?.fullName.isNotNullOrNoEmpty ==
                                true
                            ? state.userRequest?.fullName?.split(" ")[0] ?? ""
                            : "",
                        onChanged: (value) {
                          context
                              .read<EditProfileCubit>()
                              .onFullNameChange(firstName: value);
                        },
                        decoration: const InputDecoration(
                          label: Text('First Name'),
                        ),
                      ),
                    ),
                    Container(
                      padding: context.onlyRightPaddingMedium,
                      width: context.dynamicWidth(0.48),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your last name";
                          }
                          return null;
                        },
                        initialValue: state
                                    .userRequest?.fullName.isNotNullOrNoEmpty ==
                                true
                            ? state.userRequest?.fullName?.split(" ")[1] ?? ""
                            : "",
                        onChanged: (value) {
                          context
                              .read<EditProfileCubit>()
                              .onFullNameChange(lastName: value);
                        },
                        decoration: const InputDecoration(
                          label: Text('Last Name'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: context.verticalPaddingLow,
                child: Row(
                  children: [
                    Container(
                        padding: context.onlyLeftPaddingMedium,
                        width: context.dynamicWidth(0.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your username";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                context
                                    .read<EditProfileCubit>()
                                    .onUserNameChange(value);
                              },
                              initialValue: state.userRequest?.userName,
                              decoration: const InputDecoration(
                                label: Text('Username'),
                              ),
                            ),
                            state.isExistUserName == true
                                ? Container(
                                    padding: context.onlyLeftPaddingLow,
                                    child: Text(
                                      "Username is already exist",
                                      style: TextStyle(
                                          color: context.colorScheme.error),
                                    ))
                                : const SizedBox()
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: context.verticalPaddingLow,
                child: Container(
                    padding: context.horizontalPaddingMedium,
                    child: TextFormField(
                      onChanged: (value) {
                        context.read<EditProfileCubit>().onEmailChange(value);
                      },
                      initialValue: state.userRequest?.email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    )),
              ),
              Padding(
                padding: context.verticalPaddingLow,
                child: Container(
                    padding: context.horizontalPaddingMedium,
                    child: TextFormField(
                      onChanged: (value) {
                        context
                            .read<EditProfileCubit>()
                            .onPhoneNumberChange(value);
                      },
                      initialValue: state.userRequest?.phoneNumber ?? "",
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                    )),
              ),
              Padding(
                padding: context.verticalPaddingLow,
                child: Container(
                    padding: context.horizontalPaddingMedium,
                    child: TextFormField(
                      onChanged: (value) {
                        context.read<EditProfileCubit>().onAboutChange(value);
                      },
                      maxLines: 3,
                      initialValue: state.userRequest?.about,
                      decoration: const InputDecoration(
                          labelText: 'About Yourself',
                          alignLabelWithHint: true),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
