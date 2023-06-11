import 'package:auto_route/auto_route.dart';
import 'package:f41/app/student_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product/widgets/global_progress_loading_bar.dart';

@RoutePage()
class AppWrapperPage extends StatelessWidget {
  const AppWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AutoRouter(),
        BlocBuilder<StudentAppCubit, StudentAppViewModel>(
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
