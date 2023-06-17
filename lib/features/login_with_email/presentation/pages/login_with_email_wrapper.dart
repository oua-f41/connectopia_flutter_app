import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_with_email_cubit.dart';

@RoutePage()
class LoginWithEmailWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  const LoginWithEmailWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => LoginWithEmailCubit(), child: this);
  }
}
