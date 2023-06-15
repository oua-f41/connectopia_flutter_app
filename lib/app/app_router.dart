import 'package:auto_route/auto_route.dart';
import 'app_wrapper_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    CustomRoute(page: AppWrapperRoute.page, children: const []),
  ];
}
