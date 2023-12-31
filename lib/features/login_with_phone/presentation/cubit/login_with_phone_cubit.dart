import 'dart:async';
import 'package:connectopia/product/widgets/info_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_router.dart';
import '../../../../app/base_cubit.dart';
import '../../../../app/connectopia_app_cubit.dart';
import '../../../../core/helpers/globals.dart';
import '../../../../product/auth/data/operations/login_operations.dart';
import '../../../../product/cache/application_properties.dart';
import '../../../../product/cache/application_properties_manager.dart';
import '../../../../product/cache/cache_enums.dart';
import '../../../../product/constants/duration_constants.dart';
import '../../../../product/di/injection.dart';
import '../../../../product/models/user/request/user_request.dart';
import 'view_model/login_with_phone_view_model.dart';

class LoginWithPhoneCubit extends BaseCubit<LoginWithPhoneViewModel> {
  LoginWithPhoneCubit()
      : super(LoginWithPhoneViewModel(
            selectedCountryCode: "+90",
            durationSeconds: DurationConstants.verifyPhoneDuration.inSeconds,
            verifyPhoneNumberController: TextEditingController()));

  void changePhoneNumber(String phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void changeSelectedCountryCode(String selectedCountryCode) {
    emit(state.copyWith(selectedCountryCode: "+$selectedCountryCode"));
  }

  void changeVerificationCode(String verificationCode) {
    emit(state.copyWith(verificationCode: verificationCode));
  }

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> sendCode() async {
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: true);
    startTimer();
    emit(state.copyWith(
        durationSeconds: DurationConstants.verifyPhoneDuration.inSeconds));
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${state.selectedCountryCode}${state.phoneNumber}",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          snackbarKey.currentState!.showSnackBar(InfoSnackBar(
              contentText: e.message ?? "An error occured while sending code"));
          emit(state.copyWith(verificationCode: ""));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(state.copyWith(verificationId: verificationId));
          getIt.get<AppRouter>().replace(const LoginVerifyPhoneRoute());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          snackbarKey.currentState!.showSnackBar(InfoSnackBar(
              contentText: "Code sending timed out. Please try again"));
        },
        timeout: DurationConstants.verifyPhoneDuration);
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: false);
  }

  Future<void> resendCode() async {
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: true);
    startTimer();
    emit(state.copyWith(
        durationSeconds: DurationConstants.verifyPhoneDuration.inSeconds));
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${state.selectedCountryCode}${state.phoneNumber}",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          snackbarKey.currentState!.showSnackBar(InfoSnackBar(
              contentText: e.message ?? "An error occured while sending code"));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(state.copyWith(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          snackbarKey.currentState!.showSnackBar(InfoSnackBar(
              contentText: "Code sending timed out. Please try again"));
        },
        timeout: DurationConstants.verifyPhoneDuration);
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: false);
  }

  Future<void> verifyCode() async {
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: true);
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: state.verificationId ?? "",
          smsCode: state.verificationCode ?? "");
      UserCredential user = await auth.signInWithCredential(credential);
      if (user.user != null) {
        UserRequest createdUser = UserRequest(
          id: user.user!.uid,
          phoneNumber: state.phoneNumber,
        );
        bool isNewUser = await getIt.get<ILoginOperations>().login(createdUser);
        if (isNewUser) {
          getIt
              .get<AppRouter>()
              .replace(RegisterRoute(userRequest: createdUser));
        } else {
          getIt
              .get<AppRouter>()
              .replace(const MainRoute(children: [HomeRoute()]));
        }
        ApplicationPropertiesManager applicationPropertiesManager =
            getIt.get<ApplicationPropertiesManager>();

        applicationPropertiesManager.putItem(
            CacheEnums.applicationProperties.name,
            applicationPropertiesManager
                    .getItem(CacheEnums.applicationProperties.name)
                    ?.copyWith(isNewUser: false) ??
                ApplicationProperties(isNewUser: false));
      }
    } catch (e) {
      snackbarKey.currentState!.showSnackBar(InfoSnackBar(
          contentText:
              e as String? ?? "An error occured while verifying code"));
      state.verifyPhoneNumberController?.clear();
    }
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: false);
  }

  void startTimer() {
    emit(state.copyWith(
        durationSeconds: DurationConstants.verifyPhoneDuration.inSeconds));
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (state.durationSeconds == 0) {
          timer.cancel();
        } else {
          emit(state.copyWith(durationSeconds: state.durationSeconds - 1));
        }
      },
    );
  }
}
