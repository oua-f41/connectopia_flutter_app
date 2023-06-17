import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      required this.onChanged,
      required this.isVisiblePassword,
      required this.changeVisibility});

  final Function(String) onChanged;
  final bool isVisiblePassword;
  final VoidCallback changeVisibility;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isVisiblePassword = false;

  @override
  void initState() {
    super.initState();
    isVisiblePassword = widget.isVisiblePassword;
  }

  @override
  void didUpdateWidget(covariant PasswordTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isVisiblePassword != widget.isVisiblePassword) {
      setState(() {
        isVisiblePassword = widget.isVisiblePassword;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        autocorrect: false,
        obscureText: isVisiblePassword ? false : true,
        enableSuggestions: false,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password cannot be empty";
          }
          if (value.length < 6) {
            return "Password cannot be 6";
          }
          return null;
        },
        onChanged: (value) {
          widget.onChanged(value);
        },
        style: context.textTheme.headlineLarge
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            label: const Text("Password"),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
                onPressed: () {
                  widget.changeVisibility();
                },
                icon: AnimatedCrossFade(
                  crossFadeState: isVisiblePassword
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: context.durationLow,
                  firstChild: const Icon(Icons.visibility),
                  secondChild: const Icon(Icons.visibility_off),
                ))));
  }
}
