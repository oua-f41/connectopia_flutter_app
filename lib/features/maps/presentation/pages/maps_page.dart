import 'package:auto_route/auto_route.dart';
import 'package:connectopia/features/maps/presentation/cubit/maps_cubit.dart';
import 'package:connectopia/features/maps/presentation/widgets/event_map.dart';
import 'package:connectopia/features/maps/presentation/widgets/maps_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/view_model/maps_view_model.dart';
import '../widgets/maps_bottom_bar.dart';

@RoutePage()
class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(),
        bottomNavigationBar: MapsBottomBar(),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const EventMap(),
            BlocBuilder<MapsCubit, MapsViewModel>(
              builder: (context, state) {
                return AnimatedCrossFade(
                  crossFadeState: state.selectedEvent != null
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: context.durationLow,
                  secondChild: const SizedBox(),
                  firstChild: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SafeArea(child: MapsEventCard()),
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}
