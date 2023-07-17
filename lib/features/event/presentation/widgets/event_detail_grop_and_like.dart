import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/event/presentation/cubit/event_detail_cubit.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:connectopia/product/models/core_models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../product/constants/image_constants.dart';

class EventDetailGroupAndLike extends StatelessWidget {
  const EventDetailGroupAndLike({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.verticalPaddingNormal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  if (state.event?.group == null) return;
                  context.router.push(
                    GroupDetailRoute(
                      group: state.event?.group,
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 32.0,
                      width: 32.0,
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: state.event?.group?.iconUrl.isNotNullOrNoEmpty ==
                                true
                            ? DecorationImage(
                                image: NetworkImage(
                                    state.event?.group?.iconUrl ??
                                        event.group?.iconUrl ??
                                        ""),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: AssetImage(
                                    ImageConstants.defaultGroupPhoto.imagePath),
                                fit: BoxFit.cover,
                              ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 4.0,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      state.event?.group?.name ?? event.group?.name ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  context.router.push(ProfileListRoute(
                      users: state.event?.userLikeEvents
                              ?.map((e) => e.user)
                              .toList() ??
                          [],
                      title: "Likeds"));
                },
                child: Row(
                  children: [
                    Container(
                        padding: context.paddingLow,
                        child: const Icon(Icons.favorite)),
                    Text(
                      state.event?.userLikeEvents?.length.toString() ??
                          event.userLikeEvents?.length.toString() ??
                          "0",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
