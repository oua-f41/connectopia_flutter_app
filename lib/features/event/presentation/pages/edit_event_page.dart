import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/edit_event_view_model.dart';
import 'package:connectopia/features/maps/presentation/cubit/maps_cubit.dart';
import 'package:connectopia/product/models/core_models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/edit_event_cubit.dart';
import '../widgets/delete_event_button.dart';
import '../widgets/edit_event_form.dart';

@RoutePage()
class EditEventPage extends StatelessWidget with AutoRouteWrapper {
  const EditEventPage({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: const [
          DeleteEventButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: context.paddingLow,
          child: const EditEventForm()
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          bool? response = await context.read<EditEventCubit>().updateEvent();
          if (response == true) {
            context.router.pop(EditEventActions.update);
            await context.read<MapsCubit>().refresh();
          }
        },
        label: const Text('Update Event')),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => EditEventCubit()..init(event),
      child: this,
    );
  }
}
