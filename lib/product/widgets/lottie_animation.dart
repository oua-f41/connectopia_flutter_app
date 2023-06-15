// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/lottie_constants.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({
    Key? key,
    required this.asset,
    this.height,
    this.width,
  }) : super(key: key);

  final LottieConstants asset;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(asset.lottiePath, height: height, width: width);
  }
}
