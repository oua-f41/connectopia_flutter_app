import 'package:auto_route/auto_route.dart';
import 'package:f41/product/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../app/app_router.dart';
import '../helpers/token_operations.dart';

abstract class SplashViewModel extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Hive.initFlutter();
      await TokenOperations.refreshToken();
      Future.delayed(const Duration(seconds: 2), () {
        context.router
            .pushAndPopUntil(const MainRoute(), predicate: (route) => true);
      });
    });
  }
}
