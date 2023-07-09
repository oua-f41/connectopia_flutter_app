// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/presentation/base_view_model.dart';
import '../../../domain/models/request/login_with_email_request.dart';

class LoginWithEmailViewModel extends BaseViewModel {
  LoginWithEmailRequest? loginWithEmailRequest;
  GlobalKey<FormState> loginFormKey;
  GlobalKey<FormState> forgotFormKey;
  bool isVisibePassword;

  LoginWithEmailViewModel(
      {super.isLoading = false,
      this.loginWithEmailRequest,
      required this.loginFormKey,
      required this.forgotFormKey,
      required this.isVisibePassword});

  LoginWithEmailViewModel copyWith({
    bool? isLoading,
    LoginWithEmailRequest? loginWithEmailRequest,
    GlobalKey<FormState>? loginFormKey,
    GlobalKey<FormState>? forgotFormKey,
    bool? isVisibePassword,
  }) {
    return LoginWithEmailViewModel(
      isLoading: isLoading ?? this.isLoading,
      loginWithEmailRequest:
          loginWithEmailRequest ?? this.loginWithEmailRequest,
      loginFormKey: loginFormKey ?? this.loginFormKey,
      forgotFormKey: forgotFormKey ?? this.forgotFormKey,
      isVisibePassword: isVisibePassword ?? this.isVisibePassword,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        loginWithEmailRequest,
        loginFormKey,
        forgotFormKey,
        isVisibePassword,
      ];
}
