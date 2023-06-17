import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/login_with_email_cubit.dart';
import '../cubit/view_model/login_with_email_view_model.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginWithEmailCubit, LoginWithEmailViewModel>(
      builder: (context, state) {
        print(state.loginWithEmailRequest?.email);
        return TextFormField(
            initialValue: state.loginWithEmailRequest?.email,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) {
              if (!(value!.isValidEmail)) {
                return "Email is not valid";
              }
              return null;
            },
            onChanged: (value) {
              onChanged(value);
            },
            style: context.textTheme.headlineLarge
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            decoration: const InputDecoration(
              label: Text("Email"),
              prefixIcon: Icon(Icons.email),
            ));
      },
    );
  }
}
