import 'package:flutter/cupertino.dart';

import '../../../../../core/presentation/base_view_model.dart';
import '../../../../../product/models/user/request/user_request.dart';

class RegisterViewModel extends BaseViewModel {
  UserRequest? userRequest;
  GlobalKey<FormState> registerFormKey;
  bool? isExistUserName;

  RegisterViewModel(
      {this.userRequest, required this.registerFormKey, this.isExistUserName});

  RegisterViewModel copyWith({
    UserRequest? userRequest,
    GlobalKey<FormState>? registerFormKey,
    bool? isExistUserName,
  }) {
    return RegisterViewModel(
      registerFormKey: registerFormKey ?? this.registerFormKey,
      userRequest: userRequest ?? this.userRequest,
      isExistUserName: isExistUserName ?? this.isExistUserName,
    );
  }

  @override
  List<Object?> get props => [userRequest, registerFormKey, isExistUserName];
}
