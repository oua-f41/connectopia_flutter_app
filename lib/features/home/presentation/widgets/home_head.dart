import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../../../profile/presentation/cubit/view_model/profile_view_model.dart';
import '../../../weather/presentation/widgets/weather_snipped.dart';
import '../cubit/home_cubit.dart';
import '../cubit/view_model/home_view_model.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<HomeCubit, HomeViewModel>(
                builder: (context, state) {
                  return Text(
                    state.title ?? "",
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  );
                },
              ),
              BlocBuilder<ProfileCubit, ProfileViewModel>(
                builder: (context, state) {
                  return state.isLoading
                      ? Container(
                          padding: context.verticalPaddingLow,
                          child: const SkeletonLine(
                            style: SkeletonLineStyle(
                              width: 180,
                              height: 20,
                            ),
                          ),
                        )
                      : state.profileResponse?.fullName.isNotNullOrNoEmpty ==
                              true
                          ? Text(
                              "${state.profileResponse?.fullName?.split(" ")[0]};",
                              style: context.textTheme.headlineMedium,
                            )
                          : const SizedBox();
                },
              ),
            ],
          ),
          const WeatherSnipped()
        ],
      ),
    );
  }
}
