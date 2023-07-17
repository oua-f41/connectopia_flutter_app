import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/login_with_email_cubit.dart';
import '../cubit/view_model/login_with_email_view_model.dart';
import 'email_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginWithEmailCubit, LoginWithEmailViewModel>(
      builder: (context, state) {
        return Form(
          key: state.forgotFormKey,
          child: Column(
            children: [
              Container(
                padding: context.verticalPaddingNormal,
                child: EmailTextField(
                    onChanged:
                        context.read<LoginWithEmailCubit>().onEmailChanged),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<LoginWithEmailCubit>().forgotPassword();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.emailForgotPasswordForm,
                  ))
            ],
          ),
        );
      },
    );
  }
}
