import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/category/domain/models/response/category_details_response.dart';
import '../features/category/presentation/pages/category_page.dart';
import '../features/discover/presentation/discover_page.dart';
import '../features/donate/presentation/pages/donate_page.dart';
import '../features/event/presentation/pages/add_event_page.dart';
import '../features/event/presentation/pages/edit_event_page.dart';
import '../features/event/presentation/pages/event_detail_page.dart';
import '../features/groups/domain/models/response/group_response.dart';
import '../features/groups/presentation/pages/add_group_page.dart';
import '../features/groups/presentation/pages/edit_group_page.dart';
import '../features/groups/presentation/pages/group_detail_page.dart';
import '../features/groups/presentation/pages/groups_page.dart';
import '../features/location_picking/presentation/location_picking_page.dart';
import '../features/main/presentation/main_page.dart';
import '../features/login_with_email/presentation/pages/forgot_password_page.dart';
import '../features/login_with_email/presentation/pages/login_with_email_page.dart';
import '../features/login_with_email/presentation/pages/login_with_email_wrapper.dart';
import '../features/login_with_phone/presentation/pages/login_verify_phone_page.dart';
import '../features/login_with_phone/presentation/pages/login_with_phone_page.dart';
import '../features/login_with_phone/presentation/pages/login_with_phone_wrapper.dart';
import '../features/home/presentation/home_page.dart';
import '../features/main_login/presentation/pages/main_login_page.dart';
import '../features/maps/presentation/pages/maps_page.dart';
import '../features/onboard/presentation/pages/onboard_page.dart';
import '../features/profile/domain/models/response/profile_response.dart';
import '../features/profile/presentation/pages/edit_profile_page.dart';
import '../features/profile/presentation/pages/own_profile_page.dart';
import '../features/profile/presentation/pages/profile_list_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/register/presentation/pages/register_page.dart';
import '../features/search/presentation/pages/search_page.dart';
import '../features/settings/presentation/settings_page.dart';
import '../product/helpers/auth_guard.dart';
import '../product/models/core_models/category.dart';
import '../product/models/core_models/event.dart';
import '../product/models/core_models/group.dart';
import '../product/models/core_models/user.dart';
import '../product/models/user/request/user_request.dart';
import '../features/splash/splash_page.dart';
import 'app_wrapper_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: "/", initial: true),
    CustomRoute(path: "/app", page: AppWrapperRoute.page, children: [
      AutoRoute(path: "main", page: MainRoute.page, children: [
        AutoRoute(path: "discover", page: DiscoverRoute.page, children: [
          AutoRoute(
            path: "category",
            page: CategoryRoute.page,
          ),
          AutoRoute(path: "search", page: SearchRoute.page),
          AutoRoute(path: "groups", page: GroupsRoute.page),
        ]),
        CustomRoute(
          path: "maps",
          page: MapsRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 200,
        ),
        CustomRoute(
          page: OwnProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 200,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
      ]),
      CustomRoute(
          page: OnboardRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
          fullMatch: true),
      AutoRoute(
        page: MainLoginRoute.page,
      ),
      AutoRoute(page: RegisterRoute.page),
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
      AutoRoute(page: AddGroupRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: AddEventRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: EditEventRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: LocationPickingRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: ProfileRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: ProfileListRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: EditProfileRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: GroupDetailRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: EditGroupRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: EventDetailRoute.page, path: "event/:id", guards: [
        AuthGuard(),
      ]),
      AutoRoute(page: SettingsRoute.page, guards: [AuthGuard()]),
      AutoRoute(page: DonateRoute.page, guards: [AuthGuard()]),
    ]),
  ];
}
