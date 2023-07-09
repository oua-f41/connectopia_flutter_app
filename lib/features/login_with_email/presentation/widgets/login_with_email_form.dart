import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../cubit/login_with_email_cubit.dart';
import '../cubit/view_model/login_with_email_view_model.dart';
import 'email_text_field.dart';
import 'password_text_field.dart';

class LoginWithEmailForm extends StatelessWidget {
  const LoginWithEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginWithEmailCubit, LoginWithEmailViewModel>(
      builder: (context, state) {
        return Form(
          key: state.loginFormKey,
          child: Column(
            children: [
              Container(
                padding: context.verticalPaddingLow,
                child: EmailTextField(
                    onChanged:
                        context.read<LoginWithEmailCubit>().onEmailChanged),
              ),
              Container(
                  padding: context.verticalPaddingNormal,
                  child: PasswordTextField(
                    isVisiblePassword: state.isVisibePassword,
                    changeVisibility: context
                        .read<LoginWithEmailCubit>()
                        .changeIsVisiblePassword,
                    onChanged:
                        context.read<LoginWithEmailCubit>().onPasswordChanged,
                  )),
              Container(
                alignment: Alignment.centerRight,
                width: context.dynamicWidth(1),
                child: InkWell(
                    onTap: () {
                      context.router.push(ForgotPasswordRoute());
                    },
                    child: const Text("Forgot Password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ))),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<LoginWithEmailCubit>().login();
                  },
                  child: const Text(
                    "Login",
                  ))
            ],
          ),
        );
      },
    );
  }
}
