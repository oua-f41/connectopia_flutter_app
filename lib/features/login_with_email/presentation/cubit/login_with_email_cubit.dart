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
import '../../../../product/di/injection.dart';
import '../../../../product/models/user/request/user_request.dart';
import '../../../../product/widgets/info_snack_bar.dart';
import '../../domain/models/request/login_with_email_request.dart';
import 'view_model/login_with_email_view_model.dart';

class LoginWithEmailCubit extends BaseCubit<LoginWithEmailViewModel> {
  LoginWithEmailCubit()
      : super(LoginWithEmailViewModel(
            loginFormKey: GlobalKey<FormState>(),
            forgotFormKey: GlobalKey<FormState>(),
            loginWithEmailRequest: LoginWithEmailRequest(),
            isVisibePassword: false));

  bool firstTry = true;

  void onEmailChanged(String email) {
    emit(state.copyWith(
        loginWithEmailRequest:
            state.loginWithEmailRequest?.copyWith(email: email)));
    if (!firstTry) {
      state.loginFormKey.currentState?.validate();
      state.forgotFormKey.currentState?.validate();
    }
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(
        loginWithEmailRequest:
            state.loginWithEmailRequest?.copyWith(password: password)));
    if (!firstTry) {
      state.loginFormKey.currentState?.validate();
    }
  }

  void changeIsVisiblePassword() {
    emit(state.copyWith(isVisibePassword: !state.isVisibePassword));
  }

  void changeIsLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> login() async {
    if (state.loginFormKey.currentState?.validate() ?? false) {
      getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: true);
      await loginWithEmailAndPassword();
      getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: false);
    }
    firstTry = false;
  }

  Future<void> forgotPassword() async {
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: true);
    changeIsLoading();
    if (state.forgotFormKey.currentState?.validate() ?? false) {
      await rememberPassword();
    }
    firstTry = false;
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: false);
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.loginWithEmailRequest?.email ?? "",
        password: state.loginWithEmailRequest?.password ?? "",
      );
      UserRequest createdUser =
          UserRequest(id: user.user!.uid, email: user.user!.email);
      await getIt.get<ILoginOperations>().login(createdUser);
      getIt.get<AppRouter>().replace(RegisterRoute(userRequest: createdUser));
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseLoginErrors.weakPassword.errorType) {
        snackbarKey.currentState!.showSnackBar(InfoSnackBar(
            contentText: FirebaseLoginErrors.weakPassword.message));
      } else if (e.code == FirebaseLoginErrors.emailAlreadyInUse.errorType) {
        snackbarKey.currentState!.showSnackBar(InfoSnackBar(
            contentText: FirebaseLoginErrors.emailAlreadyInUse.message));
      }
    } catch (e) {
      snackbarKey.currentState!
          .showSnackBar(InfoSnackBar(contentText: e.toString()));
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.loginWithEmailRequest?.email ?? "",
        password: state.loginWithEmailRequest?.password ?? "",
      );
      await getIt
          .get<ILoginOperations>()
          .login(UserRequest(id: user.user!.uid, email: user.user!.email));
      getIt.get<AppRouter>().pop();
      getIt.get<AppRouter>().replace(const MainRoute(children: [HomeRoute()]));
      ApplicationPropertiesManager applicationPropertiesManager =
          getIt.get<ApplicationPropertiesManager>();

      applicationPropertiesManager.putItem(
          CacheEnums.applicationProperties.name,
          applicationPropertiesManager
                  .getItem(CacheEnums.applicationProperties.name)
                  ?.copyWith(isNewUser: false) ??
              ApplicationProperties(isNewUser: false));
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseLoginErrors.userNotFound.errorType) {
        await createUserWithEmailAndPassword();
      } else if (e.code == FirebaseLoginErrors.wrongPassword.errorType) {
        snackbarKey.currentState!.showSnackBar(InfoSnackBar(
            contentText: FirebaseLoginErrors.wrongPassword.message));
      }
    }
  }

  Future<void> rememberPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: state.loginWithEmailRequest?.email ?? "",
      );
      getIt.get<AppRouter>().pop();
      snackbarKey.currentState!.showSnackBar(
          InfoSnackBar(contentText: "Sent mail for reset password"));
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseLoginErrors.userNotFound.errorType) {
        snackbarKey.currentState!.showSnackBar(InfoSnackBar(
            contentText: FirebaseLoginErrors.userNotFound.message));
      }
    }
  }
}

enum FirebaseLoginErrors {
  weakPassword,
  emailAlreadyInUse,
  userNotFound,
  wrongPassword,
}

extension FirebaseLoginErrorsExtension on FirebaseLoginErrors {
  String get errorType {
    switch (this) {
      case FirebaseLoginErrors.weakPassword:
        return "weak-password";
      case FirebaseLoginErrors.emailAlreadyInUse:
        return "email-already-in-use";
      case FirebaseLoginErrors.userNotFound:
        return "user-not-found";
      case FirebaseLoginErrors.wrongPassword:
        return "wrong-password";
    }
  }

  String get message {
    switch (this) {
      case FirebaseLoginErrors.weakPassword:
        return "The password provided is too weak.";
      case FirebaseLoginErrors.emailAlreadyInUse:
        return "The account already exists for that email.";
      case FirebaseLoginErrors.userNotFound:
        return "No user found for that email.";
      case FirebaseLoginErrors.wrongPassword:
        return "Wrong password provided for that user.";
    }
  }
}
