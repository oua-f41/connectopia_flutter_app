import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/groups/presentation/cubit/group_detail_cubit.dart';
import 'package:connectopia/features/groups/presentation/cubit/view_model/group_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../app/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupDetailCountInformations extends StatelessWidget {
  const GroupDetailCountInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailViewModel>(
      builder: (context, state) {
        return state.groupResponse != null
            ? Padding(
                padding: context.verticalPaddingNormal,
                child: Container(
                  padding: context.horizontalPaddingHigh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          context.router.push(
                            ProfileListRoute(
                              users: state.groupResponse?.userGroups
                                      ?.map((e) => e.user)
                                      .toList() ??
                                  [],
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Text(
                              state.groupResponse?.userGroups?.length
                                      .toString() ??
                                  "",
                              style: context.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              AppLocalizations.of(context)!.members,
                              style: context.textTheme.bodyMedium!.copyWith(
                                  color: context.colorScheme.outline,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              state.groupResponse?.events?.length.toString() ??
                                  "0",
                              style: context.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              AppLocalizations.of(context)!.events,
                              style: context.textTheme.bodyMedium!.copyWith(
                                  color: context.colorScheme.outline,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : state.isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              width: 60,
                              height: 50,
                              padding: context.paddingLow)),
                      SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              width: 60,
                              height: 50,
                              padding: context.paddingLow)),
                    ],
                  )
                : const SizedBox();
      },
    );
  }
}
