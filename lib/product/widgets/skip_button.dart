import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text("Skip",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ColorConstants.darkGrey)));
  }
}
