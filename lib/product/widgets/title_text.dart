import 'package:flutter/material.dart';
import '../constants/edgeInsents_constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsConstants.onboardSubtitlePadding,
      child: Text(text, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}