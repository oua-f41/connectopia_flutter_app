import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class OnboardLottie extends StatelessWidget {
  const OnboardLottie({
    super.key,
    required this.lottiePath,
  });

  final String lottiePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Lottie.asset(lottiePath),
      ),
    );
  }
}
