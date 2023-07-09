import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/maps/presentation/cubit/maps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/category/presentation/cubit/category_cubit.dart';
import '../product/widgets/global_progress_loading_bar.dart';
import 'connectopia_app_cubit.dart';

@RoutePage()
class AppWrapperPage extends StatelessWidget with AutoRouteWrapper {
  const AppWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeroControllerScope(
            controller: HeroController(), child: const AutoRouter()),
        BlocBuilder<ConnectopiaAppCubit, ConnectopiaAppViewModel>(
          builder: (context, state) {
            return state.isLoading
                ? const GlobalProgressLoadingBar()
                : const SizedBox();
          },
        ),
      ],
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (ctx) => CategoryCubit()..init(),
      ),
      BlocProvider(
        create: (ctx) => MapsCubit()..init(),
      ),
    ], child: this);
  }
}
