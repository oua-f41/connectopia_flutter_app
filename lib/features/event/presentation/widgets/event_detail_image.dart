import 'package:connectopia/features/event/presentation/cubit/event_detail_cubit.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../product/models/core_models/event.dart';

class EventDetailImage extends StatelessWidget {
  const EventDetailImage({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return state.event?.eventPhotoUrl.isNotNullOrNoEmpty == true ||
                event.eventPhotoUrl.isNotNullOrNoEmpty == true
            ? Image.network(
                state.event?.eventPhotoUrl ?? event.eventPhotoUrl ?? "",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SkeletonAvatar();
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.event,
                    size: 150,
                  );
                },
              )
            : const Icon(
                Icons.event,
                size: 150,
              );
      },
    );
  }
}
