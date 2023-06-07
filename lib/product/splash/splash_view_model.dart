import 'package:auto_route/auto_route.dart';
import 'package:f41/product/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../app/app_router.dart';
import '../../core/helpers/refresh_token.dart';
import '../../product/di/injection.dart';

abstract class SplashViewModel extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Hive.initFlutter();
      await SetupToken.refreshToken();
      Future.delayed(const Duration(seconds: 2), () {
        context.router
            .pushAndPopUntil(const MainRoute(), predicate: (route) => true);
      });
    });
  }
}
