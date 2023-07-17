import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

import '../../../groups/presentation/widgets/group_card.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../../../profile/presentation/cubit/view_model/profile_view_model.dart';
import '../cubit/home_cubit.dart';

class HomeAttendedGroups extends StatelessWidget {
  const HomeAttendedGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? BlocBuilder<ProfileCubit, ProfileViewModel>(
            builder: (context, state) {
              return Container(
                  padding: context.verticalPaddingNormal,
                  height: state.isLoading
                      ? context.dynamicHeight(0.36)
                      : state.profileResponse?.userGroups?.isNotEmpty == true
                          ? context.dynamicHeight(0.36)
                          : 0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context.watch<HomeCubit>().state.isLoading
                        ? 10
                        : state.profileResponse?.userGroups
                                ?.map((e) => e.group)
                                .toList()
                                .length ??
                            0,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: context.paddingLow,
                        child: context.watch<HomeCubit>().state.isLoading
                            ? SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                width: context.dynamicWidth(0.5),
                                height: context.dynamicHeight(0.2),
                                borderRadius: BorderRadius.circular(25),
                              ))
                            : GroupCard(
                                group: state.profileResponse?.userGroups
                                    ?.map((e) => e.group)
                                    .toList()[index]),
                      );
                    },
                  ));
            },
          )
        : const SizedBox();
  }
}
