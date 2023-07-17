import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constants/image_constants.dart';

class GroupFormImage extends StatelessWidget {
  const GroupFormImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingMedium,
      child: AnimatedContainer(
        duration: context.durationLow,
        height:
            context.general.isKeyBoardOpen ? 0 : context.dynamicHeight(0.2),
        child: Image.asset(
          ImageConstants.logo.imagePath,
        ) ,
      ),
    );
  }
}