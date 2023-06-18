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
    MainLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainLoginPage(),
      );
    },
    OnboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardPage(),
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
