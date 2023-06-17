import 'package:flutter/material.dart';

import '../../../../../core/presentation/base_view_model.dart';

class LoginWithPhoneViewModel extends BaseViewModel {
  String? phoneNumber;
  String? selectedCountryCode;
  String? verificationId;
  String? verificationCode;
  TextEditingController? verifyPhoneNumberController;
  int durationSeconds;

  LoginWithPhoneViewModel(
      {isLoading = false,
      required this.durationSeconds,
      this.phoneNumber,
      this.selectedCountryCode,
      this.verificationId,
      this.verificationCode,
      this.verifyPhoneNumberController})
      : super(isLoading: isLoading);

  LoginWithPhoneViewModel copyWith(
      {bool? isLoading,
      int? durationSeconds,
      String? phoneNumber,
      String? selectedCountryCode,
      String? verificationId,
      String? verificationCode,
      TextEditingController? verifyPhoneNumberController}) {
    return LoginWithPhoneViewModel(
      isLoading: isLoading ?? this.isLoading,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      selectedCountryCode: selectedCountryCode ?? this.selectedCountryCode,
      verificationId: verificationId ?? this.verificationId,
      verificationCode: verificationCode ?? this.verificationCode,
      verifyPhoneNumberController:
          verifyPhoneNumberController ?? this.verifyPhoneNumberController,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        phoneNumber,
        selectedCountryCode,
        verificationId,
        verificationCode,
        verifyPhoneNumberController,
        durationSeconds,
      ];
}
