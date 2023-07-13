import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/event/presentation/cubit/event_detail_cubit.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../product/models/core_models/event.dart';

class EventDetailAttendeesButton extends StatelessWidget {
  const EventDetailAttendeesButton({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return Container(
            margin: context.onlyTopPaddingLow,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                context.router.push(
                  ProfileListRoute(
                      users: state.event?.eventAttendees
                              ?.map((e) => e.user)
                              .toList() ??
                          [],
                      title: "Attendees"),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      padding: context.horizontalPaddingLow,
                      child: const Icon(Icons.group)),
                  Text(
                    "${state.event?.eventAttendees?.length ?? event.eventAttendees?.length} Attendees",
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
