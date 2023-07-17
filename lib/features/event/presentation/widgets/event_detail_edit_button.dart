import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/event/presentation/cubit/event_detail_cubit.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../cubit/view_model/edit_event_view_model.dart';

class EventDetailEditButton extends StatelessWidget {
  const EventDetailEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return IconButton(
          style: IconButton.styleFrom(
            backgroundColor: context.colorScheme.outlineVariant,
          ),
          onPressed: () async {
            if (state.event == null) return;
            final action =
                await context.router.push(EditEventRoute(event: state.event!));
            if (action == EditEventActions.update) {
              context.read<EventDetailCubit>().refresh();
            }
            if (action == EditEventActions.delete) {
              context.router.pop();
            }
          },
          icon: const Icon(Icons.edit),
        );
      },
    );
  }
}
