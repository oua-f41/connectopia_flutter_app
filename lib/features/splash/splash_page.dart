import 'package:auto_route/auto_route.dart';
import 'package:f41/product/constants/lottie_constants.dart';
import 'package:f41/features/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Lottie.asset(LottieConstants.loadingAnimation.lottiePath,
              repeat: false, width: context.dynamicWidth(0.45))),
    );
  }
}
