import 'package:auto_route/auto_route.dart';
import 'package:f41/product/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
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
      body: Center(child: Lottie.asset('assets/lottie/loading_animation.json')),
    );
  }
}
