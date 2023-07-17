import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/groups/presentation/cubit/view_model/group_detail_view_model.dart';
import 'package:connectopia/features/groups/presentation/widgets/group_detail_attending.dart';
import 'package:connectopia/features/groups/presentation/widgets/group_detail_count_informations.dart';
import 'package:connectopia/features/groups/presentation/widgets/group_detail_photo.dart';
import 'package:connectopia/product/widgets/title_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../app/app_router.dart';
import '../../../../product/models/core_models/group.dart';
import '../../../maps/presentation/cubit/maps_cubit.dart';
import '../cubit/group_detail_cubit.dart';
import '../cubit/view_model/edit_group_view_model.dart';
import '../widgets/group_detail_description.dart';
import '../widgets/group_detail_event_list.dart';
import '../widgets/group_detail_grop_owner_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class GroupDetailPage extends StatelessWidget with AutoRouteWrapper {
  const GroupDetailPage({
    super.key,
    this.group,
  });

  final Group? group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GroupDetailCubit, GroupDetailViewModel>(
        builder: (context, state) {
          return RefreshIndicator(
            notificationPredicate: (notification) {
              return notification.depth == 1;
            },
            displacement: 5,
            onRefresh: context.read<GroupDetailCubit>().refresh,
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      leading: const _AutoBackButton(),
                      scrolledUnderElevation: 0,
                      shadowColor: Colors.black,
                      actions: state.groupResponse?.userId ==
                              FirebaseAuth.instance.currentUser?.uid
                          ? [
                              _EditGroupIcon(state),
                            ]
                          : null,
                      expandedHeight: state.groupResponse == null
                          ? context.dynamicHeight(0.62)
                          : state.groupResponse?.userId ==
                                  FirebaseAuth.instance.currentUser?.uid
                              ? context.dynamicHeight(0.6)
                              : context.dynamicHeight(0.72),
                      automaticallyImplyLeading: true,
                      floating: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          child: Column(
                            children: [
                              GroupDetailPhoto(group: group),
                              Padding(
                                padding: context.paddingNormal,
                                child: TitleText(
                                    text: state.groupResponse?.name ??
                                        group?.name ??
                                        ""),
                              ),
                              Text(
                                "- ${state.groupResponse?.category?.name ?? group?.category?.name ?? ""} -",
                                style: context.textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.outline,
                                    fontWeight: FontWeight.w500),
                              ),
                              const GroupDetailCountInformations(),
                              state.isLoading
                                  ? const _GroupDetailDescriptioLoading()
                                  : Column(
                                      children: [
                                        GroupDetailDescription(
                                          group: group,
                                        ),
                                        const GroupDetailOwnerButton(),
                                        const GroupDetailAttending()
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ];
                },
                body: const GroupDetailEventList()),
          );
        },
      ),
      floatingActionButton: _CreateEventButton(group: group),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupDetailCubit()..init(group?.id ?? ""),
      child: this,
    );
  }
}

class _AutoBackButton extends StatelessWidget {
  const _AutoBackButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoLeadingButton(
        builder: (context, leadingType, action) {
          return IconButton(
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.outlineVariant,
            ),
            onPressed: () {
              if (leadingType == LeadingType.back) {
                context.router.pop();
              }
            },
            icon: const Icon(Icons.arrow_back),
          );
        },
      ),
    );
  }
}

class _GroupDetailDescriptioLoading extends StatelessWidget {
  const _GroupDetailDescriptioLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SkeletonLine(
            style:
                SkeletonLineStyle(padding: EdgeInsets.symmetric(vertical: 5)),
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                alignment: Alignment.center,
                width: context.dynamicWidth(0.8),
                padding: const EdgeInsets.symmetric(vertical: 5)),
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                alignment: Alignment.center,
                width: context.dynamicWidth(0.6),
                padding: const EdgeInsets.symmetric(vertical: 5)),
          ),
        ],
      ),
    );
  }
}

class _EditGroupIcon extends StatelessWidget {
  const _EditGroupIcon(this.state);

  final GroupDetailViewModel state;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: context.colorScheme.outlineVariant,
      ),
      onPressed: () async {
        if (state.groupResponse == null ||
            state.groupResponse?.category == null) {
          return;
        }
        final response = await context.router.push(
          EditGroupRoute(
            updateGroupRequest: state.groupResponse!,
            category: state.groupResponse!.category!,
          ),
        );
        if (response == EditGroupActions.update) {
          context.read<GroupDetailCubit>().refresh();
        }
        if (response == EditGroupActions.delete) {
          context.router.pop();
        }
      },
      icon: const Icon(Icons.edit),
    );
  }
}

class _CreateEventButton extends StatelessWidget {
  const _CreateEventButton({
    required this.group,
  });

  final Group? group;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "",
      label: group?.userId != FirebaseAuth.instance.currentUser?.uid
          ? Row(
              children: [
                const Icon(Icons.attach_money_outlined),
                Padding(
                  padding: context.onlyLeftPaddingLow,
                  child: Text(AppLocalizations.of(context)!.donate),
                ),
              ],
            )
          : Row(children: [
              const Icon(Icons.add),
              Padding(
                padding: context.onlyLeftPaddingLow,
                child: Text(AppLocalizations.of(context)!.createEvent),
              ),
            ]),
      onPressed: () async {
        if (group == null) return;
        if (group?.userId == FirebaseAuth.instance.currentUser?.uid) {
          final isSuccess =
              await context.router.push(AddEventRoute(groupId: group!.id!));
          if (isSuccess == true) {
            await context.read<GroupDetailCubit>().refresh();
            await context.read<MapsCubit>().refresh();
          }
        } else {
          context.router.push(DonateRoute(group: group!));
        }
      },
    );
  }
}
