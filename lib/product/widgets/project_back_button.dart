import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class ProjectBackButton extends StatelessWidget {
  const ProjectBackButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {onPressed();},
      color: ColorConstants.darkGrey,
    );
  }
}