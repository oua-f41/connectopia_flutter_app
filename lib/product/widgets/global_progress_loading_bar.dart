import 'package:connectopia/product/constants/lottie_constants.dart';
import 'package:connectopia/product/widgets/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class GlobalProgressLoadingBar extends StatelessWidget {
  const GlobalProgressLoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: context.normalBorderRadius,
              color: context.colorScheme.outlineVariant,
            ),
            child: LottieAnimation(
              asset: LottieConstants.loadingProgress,
              height: context.dynamicHeight(0.1),
            )));
  }
}
