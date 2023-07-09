// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppWrapperPage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryPage(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DiscoverPage(),
      );
    },
    AddEventRoute.name: (routeData) {
      final args = routeData.argsAs<AddEventRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddEventPage(
          key: args.key,
          groupId: args.groupId,
        )),
      );
    },
    EditEventRoute.name: (routeData) {
      final args = routeData.argsAs<EditEventRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: EditEventPage(
          key: args.key,
          event: args.event,
        )),
      );
    },
    EventDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: EventDetailPage(
          key: args.key,
          event: args.event,
        )),
      );
    },
    AddGroupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AddGroupPage()),
      );
    },
    EditGroupRoute.name: (routeData) {
      final args = routeData.argsAs<EditGroupRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: EditGroupPage(
          key: args.key,
          updateGroupRequest: args.updateGroupRequest,
          category: args.category,
        )),
      );
    },
    GroupsRoute.name: (routeData) {
      final args = routeData.argsAs<GroupsRouteArgs>(
          orElse: () => const GroupsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: GroupsPage(
          key: args.key,
          currentCategory: args.currentCategory,
        )),
      );
    },
    GroupDetailRoute.name: (routeData) {
      final args = routeData.argsAs<GroupDetailRouteArgs>(
          orElse: () => const GroupDetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: GroupDetailPage(
          key: args.key,
          group: args.group,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomePage()),
      );
    },
    LocationPickingRoute.name: (routeData) {
      final args = routeData.argsAs<LocationPickingRouteArgs>(
          orElse: () => const LocationPickingRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LocationPickingPage(
          key: args.key,
          initialLat: args.initialLat,
          initialLng: args.initialLng,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ForgotPasswordPage(
          key: args.key,
          initialEmail: args.initialEmail,
        ),
      );
    },
    LoginWithEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginWithEmailPage(),
      );
    },
    LoginWithEmailWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginWithEmailWrapperPage()),
      );
    },
    LoginVerifyPhoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginVerifyPhonePage(),
      );
    },
    LoginWithPhoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginWithPhonePage(),
      );
    },
    LoginWithPhoneWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginWithPhoneWrapperPage()),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MainPage()),
      );
    },
    MainLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainLoginPage(),
      );
    },
    MapsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapsPage(),
      );
    },
    OnboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: EditProfilePage(
          key: args.key,
          profileResponse: args.profileResponse,
        )),
      );
    },
    OwnProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OwnProfilePage(),
      );
    },
    ProfileListRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileListPage(
          key: args.key,
          users: args.users,
          title: args.title,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProfilePage(
          key: args.key,
          user: args.user,
        )),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: RegisterPage(
          key: args.key,
          userRequest: args.userRequest,
        )),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SearchPage()),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [AppWrapperPage]
class AppWrapperRoute extends PageRouteInfo<void> {
  const AppWrapperRoute({List<PageRouteInfo>? children})
      : super(
          AppWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryPage]
class CategoryRoute extends PageRouteInfo<void> {
  const CategoryRoute({List<PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscoverPage]
class DiscoverRoute extends PageRouteInfo<void> {
  const DiscoverRoute({List<PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddEventPage]
class AddEventRoute extends PageRouteInfo<AddEventRouteArgs> {
  AddEventRoute({
    Key? key,
    required String groupId,
    List<PageRouteInfo>? children,
  }) : super(
          AddEventRoute.name,
          args: AddEventRouteArgs(
            key: key,
            groupId: groupId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEventRoute';

  static const PageInfo<AddEventRouteArgs> page =
      PageInfo<AddEventRouteArgs>(name);
}

class AddEventRouteArgs {
  const AddEventRouteArgs({
    this.key,
    required this.groupId,
  });

  final Key? key;

  final String groupId;

  @override
  String toString() {
    return 'AddEventRouteArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [EditEventPage]
class EditEventRoute extends PageRouteInfo<EditEventRouteArgs> {
  EditEventRoute({
    Key? key,
    required Event event,
    List<PageRouteInfo>? children,
  }) : super(
          EditEventRoute.name,
          args: EditEventRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'EditEventRoute';

  static const PageInfo<EditEventRouteArgs> page =
      PageInfo<EditEventRouteArgs>(name);
}

class EditEventRouteArgs {
  const EditEventRouteArgs({
    this.key,
    required this.event,
  });

  final Key? key;

  final Event event;

  @override
  String toString() {
    return 'EditEventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [EventDetailPage]
class EventDetailRoute extends PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    Key? key,
    required Event event,
    List<PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static const PageInfo<EventDetailRouteArgs> page =
      PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    required this.event,
  });

  final Key? key;

  final Event event;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [AddGroupPage]
class AddGroupRoute extends PageRouteInfo<void> {
  const AddGroupRoute({List<PageRouteInfo>? children})
      : super(
          AddGroupRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddGroupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditGroupPage]
class EditGroupRoute extends PageRouteInfo<EditGroupRouteArgs> {
  EditGroupRoute({
    Key? key,
    required GroupResponse updateGroupRequest,
    required Category category,
    List<PageRouteInfo>? children,
  }) : super(
          EditGroupRoute.name,
          args: EditGroupRouteArgs(
            key: key,
            updateGroupRequest: updateGroupRequest,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'EditGroupRoute';

  static const PageInfo<EditGroupRouteArgs> page =
      PageInfo<EditGroupRouteArgs>(name);
}

class EditGroupRouteArgs {
  const EditGroupRouteArgs({
    this.key,
    required this.updateGroupRequest,
    required this.category,
  });

  final Key? key;

  final GroupResponse updateGroupRequest;

  final Category category;

  @override
  String toString() {
    return 'EditGroupRouteArgs{key: $key, updateGroupRequest: $updateGroupRequest, category: $category}';
  }
}

/// generated route for
/// [GroupsPage]
class GroupsRoute extends PageRouteInfo<GroupsRouteArgs> {
  GroupsRoute({
    Key? key,
    CategoryDetailsResponse? currentCategory,
    List<PageRouteInfo>? children,
  }) : super(
          GroupsRoute.name,
          args: GroupsRouteArgs(
            key: key,
            currentCategory: currentCategory,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupsRoute';

  static const PageInfo<GroupsRouteArgs> page = PageInfo<GroupsRouteArgs>(name);
}

class GroupsRouteArgs {
  const GroupsRouteArgs({
    this.key,
    this.currentCategory,
  });

  final Key? key;

  final CategoryDetailsResponse? currentCategory;

  @override
  String toString() {
    return 'GroupsRouteArgs{key: $key, currentCategory: $currentCategory}';
  }
}

/// generated route for
/// [GroupDetailPage]
class GroupDetailRoute extends PageRouteInfo<GroupDetailRouteArgs> {
  GroupDetailRoute({
    Key? key,
    Group? group,
    List<PageRouteInfo>? children,
  }) : super(
          GroupDetailRoute.name,
          args: GroupDetailRouteArgs(
            key: key,
            group: group,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupDetailRoute';

  static const PageInfo<GroupDetailRouteArgs> page =
      PageInfo<GroupDetailRouteArgs>(name);
}

class GroupDetailRouteArgs {
  const GroupDetailRouteArgs({
    this.key,
    this.group,
  });

  final Key? key;

  final Group? group;

  @override
  String toString() {
    return 'GroupDetailRouteArgs{key: $key, group: $group}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationPickingPage]
class LocationPickingRoute extends PageRouteInfo<LocationPickingRouteArgs> {
  LocationPickingRoute({
    Key? key,
    double? initialLat,
    double? initialLng,
    List<PageRouteInfo>? children,
  }) : super(
          LocationPickingRoute.name,
          args: LocationPickingRouteArgs(
            key: key,
            initialLat: initialLat,
            initialLng: initialLng,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationPickingRoute';

  static const PageInfo<LocationPickingRouteArgs> page =
      PageInfo<LocationPickingRouteArgs>(name);
}

class LocationPickingRouteArgs {
  const LocationPickingRouteArgs({
    this.key,
    this.initialLat,
    this.initialLng,
  });

  final Key? key;

  final double? initialLat;

  final double? initialLng;

  @override
  String toString() {
    return 'LocationPickingRouteArgs{key: $key, initialLat: $initialLat, initialLng: $initialLng}';
  }
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    Key? key,
    String? initialEmail,
    List<PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(
            key: key,
            initialEmail: initialEmail,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<ForgotPasswordRouteArgs> page =
      PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    this.key,
    this.initialEmail,
  });

  final Key? key;

  final String? initialEmail;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, initialEmail: $initialEmail}';
  }
}

/// generated route for
/// [LoginWithEmailPage]
class LoginWithEmailRoute extends PageRouteInfo<void> {
  const LoginWithEmailRoute({List<PageRouteInfo>? children})
      : super(
          LoginWithEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginWithEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginWithEmailWrapperPage]
class LoginWithEmailWrapperRoute extends PageRouteInfo<void> {
  const LoginWithEmailWrapperRoute({List<PageRouteInfo>? children})
      : super(
          LoginWithEmailWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginWithEmailWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginVerifyPhonePage]
class LoginVerifyPhoneRoute extends PageRouteInfo<void> {
  const LoginVerifyPhoneRoute({List<PageRouteInfo>? children})
      : super(
          LoginVerifyPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginVerifyPhoneRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginWithPhonePage]
class LoginWithPhoneRoute extends PageRouteInfo<void> {
  const LoginWithPhoneRoute({List<PageRouteInfo>? children})
      : super(
          LoginWithPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginWithPhoneRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginWithPhoneWrapperPage]
class LoginWithPhoneWrapperRoute extends PageRouteInfo<void> {
  const LoginWithPhoneWrapperRoute({List<PageRouteInfo>? children})
      : super(
          LoginWithPhoneWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginWithPhoneWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainLoginPage]
class MainLoginRoute extends PageRouteInfo<void> {
  const MainLoginRoute({List<PageRouteInfo>? children})
      : super(
          MainLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapsPage]
class MapsRoute extends PageRouteInfo<void> {
  const MapsRoute({List<PageRouteInfo>? children})
      : super(
          MapsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardPage]
class OnboardRoute extends PageRouteInfo<void> {
  const OnboardRoute({List<PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required ProfileResponse profileResponse,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            profileResponse: profileResponse,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.profileResponse,
  });

  final Key? key;

  final ProfileResponse profileResponse;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profileResponse: $profileResponse}';
  }
}

/// generated route for
/// [OwnProfilePage]
class OwnProfileRoute extends PageRouteInfo<void> {
  const OwnProfileRoute({List<PageRouteInfo>? children})
      : super(
          OwnProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'OwnProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileListPage]
class ProfileListRoute extends PageRouteInfo<ProfileListRouteArgs> {
  ProfileListRoute({
    Key? key,
    required List<User?> users,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileListRoute.name,
          args: ProfileListRouteArgs(
            key: key,
            users: users,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileListRoute';

  static const PageInfo<ProfileListRouteArgs> page =
      PageInfo<ProfileListRouteArgs>(name);
}

class ProfileListRouteArgs {
  const ProfileListRouteArgs({
    this.key,
    required this.users,
    this.title,
  });

  final Key? key;

  final List<User?> users;

  final String? title;

  @override
  String toString() {
    return 'ProfileListRouteArgs{key: $key, users: $users, title: $title}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required User user,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final User user;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    required UserRequest userRequest,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            userRequest: userRequest,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.userRequest,
  });

  final Key? key;

  final UserRequest userRequest;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, userRequest: $userRequest}';
  }
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
