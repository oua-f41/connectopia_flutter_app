import 'package:connectopia/features/event/presentation/cubit/event_detail_cubit.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

import '../../../groups/presentation/widgets/group_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDetailInterestedGroups extends StatelessWidget {
  const EventDetailInterestedGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return state.groups?.isNotEmpty == true
            ? Container(
                padding: context.verticalPaddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: context.paddingLow,
                      child: Text(
                        AppLocalizations.of(context)!.interestedGroups,
                        style: context.textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: context.dynamicHeight(0.3),
                      child: state.isLoading
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => Container(
                                padding: context.paddingLow,
                                width: context.dynamicWidth(0.5),
                                child: const SkeletonAvatar(),
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.groups?.length ?? 0,
                              itemBuilder: (context, index) => Container(
                                padding: context.paddingLow,
                                width: context.dynamicWidth(0.5),
                                child: GroupCard(
                                  group: state.groups?[index],
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}
