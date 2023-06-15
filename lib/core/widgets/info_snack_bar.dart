import 'package:flutter/material.dart';

class InfoSnackBar extends SnackBar {
  InfoSnackBar({required this.onPressed, required this.contentText, super.key})
      : super(
            content: Row(
              children: [
                const Icon(Icons.info_outline),
                const SizedBox(width: 10),
                Text(contentText),
              ],
            ),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: ShapeBorder.lerp(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                1),
            action: SnackBarAction(
              label: "Retry",
              onPressed: () {
                onPressed();
              },
            ));

  final VoidCallback onPressed;
  final String contentText;
}
