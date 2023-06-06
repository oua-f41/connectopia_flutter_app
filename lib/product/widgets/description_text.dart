import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../constants/edgeInsents_constants.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsConstants.onboardSubtitlePadding,
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: ColorConstants.lightGrey, fontSize: 19)),
    );
  }
}
