import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class InfoSnackBar extends SnackBar {
  InfoSnackBar(
      {this.onPressed,
      required this.contentText,
      super.key,
      BuildContext? context})
      : super(
            backgroundColor: context?.colorScheme.secondary ?? Colors.grey,
            content: Row(
              children: [
                const Icon(Icons.info_outline),
                Text(
                  contentText,
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
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
            action: onPressed != null
                ? SnackBarAction(
                    label: "Retry",
                    onPressed: () {
                      onPressed();
                    },
                  )
                : null);

  final VoidCallback? onPressed;
  final String contentText;
}
