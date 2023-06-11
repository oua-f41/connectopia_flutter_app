import 'package:auto_route/auto_route.dart';

import '../features/deneme/deneme.dart';
import '../features/main/presentation/main_page.dart';
import '../features/onboard/presentation/main_login_page.dart';
import '../features/onboard/presentation/onboard_page.dart';
import '../product/splash/splash_page.dart';
import 'app_wrapper_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: "/"),
    AutoRoute(page: AppWrapperRoute.page, children: [
      AutoRoute(page: MainRoute.page),
      AutoRoute(page: OnboardRoute.page),
      AutoRoute(page: MainLoginRoute.page),
      AutoRoute(page: DenemeRoute.page),
    ]),
  ];
}
