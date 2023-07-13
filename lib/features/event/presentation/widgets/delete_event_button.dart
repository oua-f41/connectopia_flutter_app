import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../maps/presentation/cubit/maps_cubit.dart';
import '../cubit/edit_event_cubit.dart';
import '../cubit/view_model/edit_event_view_model.dart';

class DeleteEventButton extends StatelessWidget {
  const DeleteEventButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
            onPressed: () async {
              final isDeleteing = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: ShapeBorder.lerp(
                        RoundedRectangleBorder(
                            borderRadius: context.normalBorderRadius),
                        RoundedRectangleBorder(
                            borderRadius: context.normalBorderRadius),
                        1)!,
                    title: const Text("Delete Event"),
                    content: const Text(
                        "Are you sure you want to delete this event?"),
                    actions: [
                      OutlinedButton(
                          onPressed: () {
                            context.router.pop(false);
                          },
                          child: const Text("Back")),
                      TextButton(
                          onPressed: () {
                            context.router.pop(true);
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: context.colorScheme.error),
                          )),
                    ],
                  );
                },
              );
              if (isDeleteing == true) {
                bool response =
                    await context.read<EditEventCubit>().deleteEvent();
                if (response == true) {
                  context.router.pop(EditEventActions.delete);
                  await context.read<MapsCubit>().refresh();
                }
              }
            },
            icon: const Icon(Icons.delete),
          );
  }
}