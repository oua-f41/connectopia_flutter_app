import 'package:connectopia/features/event/presentation/cubit/event_detail_cubit.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/models/core_models/event.dart';

class EventDetailBottomActions extends StatelessWidget {
  const EventDetailBottomActions({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            width: 1.0,
            color: context.general.colorScheme.outline.withOpacity(0.1),
          ))),
          padding: context.horizontalPaddingNormal,
          height: 80.0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.072),
                  width: context.dynamicHeight(0.072),
                  child: OutlinedButton(
                      onPressed: state.likingLoading
                          ? null
                          : () {
                              if (state.isLiked == true) {
                                context.read<EventDetailCubit>().dislikeEvent();
                              } else {
                                context.read<EventDetailCubit>().likeEvent();
                              }
                            },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          padding: EdgeInsets.zero),
                      child: state.isLiked == true
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border_outlined)),
                ),
                SizedBox(
                  width: context.dynamicWidth(0.75),
                  height: context.dynamicHeight(0.075),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: state.event?.group?.owner?.id ==
                                FirebaseAuth.instance.currentUser?.uid ||
                            event.group?.owner?.id ==
                                FirebaseAuth.instance.currentUser?.uid
                        ? () {}
                        : state.attendingLoading
                            ? null
                            : () {
                                if (state.isAttended == true) {
                                  context.read<EventDetailCubit>().leftGroup();
                                } else {
                                  context
                                      .read<EventDetailCubit>()
                                      .attendEvent();
                                }
                              },
                    child: Text(
                        state.event?.group?.owner?.id ==
                                    FirebaseAuth.instance.currentUser?.uid ||
                                event.group?.owner?.id ==
                                    FirebaseAuth.instance.currentUser?.uid
                            ? "Your Event !"
                            : state.isAttended == true
                                ? "Left Event"
                                : "Attend to Event",
                        style: context.textTheme.headlineLarge?.copyWith(
                          fontSize: 16,
                          wordSpacing: 1.5,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
