import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_with_phone_cubit.dart';

@RoutePage()
class LoginWithPhoneWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  const LoginWithPhoneWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => LoginWithPhoneCubit(), child: this);
  }
}
