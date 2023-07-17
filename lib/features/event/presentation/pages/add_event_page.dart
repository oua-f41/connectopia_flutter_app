import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/event/presentation/cubit/add_event_cubit.dart';
import 'package:connectopia/features/event/presentation/widgets/add_event_form.dart';
import 'package:connectopia/features/maps/presentation/cubit/maps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class AddEventPage extends StatelessWidget with AutoRouteWrapper {
  const AddEventPage({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child:
            Container(padding: context.paddingLow, child: const AddEventForm()),
      ),
      floatingActionButton: FloatingActionButton.extended(
          heroTag: "",
          onPressed: () async {
            bool? response = await context.read<AddEventCubit>().createEvent();
            if (response == true) {
              context.router.pop(true);
              context.read<MapsCubit>().refresh();
            }
          },
          label: Text(AppLocalizations.of(context)!.createEvent)),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (context) => AddEventCubit()..init(groupId: groupId),
        child: this);
  }
}
