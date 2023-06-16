import 'package:auto_route/auto_route.dart';
import 'package:f41/product/cache/cache_enums.dart';
import 'package:f41/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../../app/app_router.dart';
import '../../product/cache/application_properties_manager.dart';
import '../../product/di/injection.dart';
import '../../product/helpers/setup_token.dart';

abstract class SplashViewModel extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SetupToken.refreshToken();

      ApplicationPropertiesManager applicationPropertiesManager =
          getIt.get<ApplicationPropertiesManager>();
      await applicationPropertiesManager.init();

      var applicationProperties = applicationPropertiesManager
          .getItem(CacheEnums.applicationProperties.name);

      Future.delayed(
          const Duration(seconds: 2),
          () => {
                if (applicationProperties?.isNewUser ?? true)
                  {context.router.replace(const OnboardRoute())}
                else
                  {context.router.replace(const MainRoute())}
              });
    });
  }
}
