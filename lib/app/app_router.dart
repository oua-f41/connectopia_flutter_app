import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../features/login_with_email/presentation/pages/forgot_password_page.dart';
import '../features/login_with_email/presentation/pages/login_with_email_page.dart';
import '../features/login_with_email/presentation/pages/login_with_email_wrapper.dart';
import '../features/login_with_phone/presentation/pages/login_verify_phone_page.dart';
import '../features/login_with_phone/presentation/pages/login_with_phone_page.dart';
import '../features/login_with_phone/presentation/pages/login_with_phone_wrapper.dart';
import '../features/main_login/presentation/pages/main_login_page.dart';
import '../features/onboard/presentation/pages/onboard_page.dart';
import '../features/register/presentation/pages/register_page.dart';
import '../features/splash/splash_page.dart';
import '../product/models/user/request/user_request.dart';
import 'app_wrapper_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: "/"),
    CustomRoute(page: AppWrapperRoute.page, children: [
      CustomRoute(
          page: OnboardRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
          fullMatch: true),
      CustomRoute(
          page: MainLoginRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 450,
          fullMatch: true),
      CustomRoute(page: RegisterRoute.page),
      AutoRoute(page: LoginWithPhoneWrapperRoute.page, children: [
        AutoRoute(
          page: LoginWithPhoneRoute.page,
        ),
        AutoRoute(page: LoginVerifyPhoneRoute.page)
      ]),
      AutoRoute(page: LoginWithEmailWrapperRoute.page, children: [
        AutoRoute(
          page: LoginWithEmailRoute.page,
        ),
        AutoRoute(page: ForgotPasswordRoute.page)
      ]),
    ]),
  ];
}
