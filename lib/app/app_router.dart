import 'package:auto_route/auto_route.dart';

import '../features/onboard/presentation/main_login_page.dart';
import '../features/onboard/presentation/onboard_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: OnboardRoute.page),
    AutoRoute(page: MainLoginRoute.page),
  ];
}
