import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product/widgets/global_progress_loading_bar.dart';
import 'connectopia_app_cubit.dart';

@RoutePage()
class AppWrapperPage extends StatelessWidget {
  const AppWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AutoRouter(),
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
}

/* */
