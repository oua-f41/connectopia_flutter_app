import 'package:connectopia/features/maps/presentation/cubit/maps_cubit.dart';
import 'package:connectopia/features/maps/presentation/cubit/view_model/maps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class MapsBottomBar extends StatelessWidget {
  const MapsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsViewModel>(
      builder: (context, state) {
        return state.isLoading == false
            ? AnimatedCrossFade(
                alignment: Alignment.bottomCenter,
                crossFadeState: state.selectedEvent != null
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: context.durationLow,
                firstChild: const MapEventCardBottomIcon(),
                secondChild: const MapsBottomOptions(),
              )
            : const SizedBox();
      },
    );
  }
}

class MapsBottomOptions extends StatelessWidget {
  const MapsBottomOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: context.colorScheme.outlineVariant,
              ),
              onPressed: context.watch<MapsCubit>().state.mapSelectedJustCity
                  ? null
                  : () {
                      context.read<MapsCubit>().getCityEvents();
                    },
              child: const Text("Your City")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: context.colorScheme.outlineVariant,
              ),
              onPressed: context.watch<MapsCubit>().state.mapSelectedJustCity
                  ? () {
                      context.read<MapsCubit>().getAllEvents();
                    }
                  : null,
              child: const Text("All Events")),
        ],
      ),
    );
  }
}

class MapEventCardBottomIcon extends StatelessWidget {
  const MapEventCardBottomIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsViewModel>(
      builder: (context, state) {
        return state.selectedEvent != null
            ? SizedBox(
                width: context.dynamicWidth(1),
                child: IconButton(
                    onPressed: () {
                      context.read<MapsCubit>().clearSelectedEvent();
                    },
                    enableFeedback: false,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 50,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 10)
                      ],
                    )),
              )
            : const SizedBox();
      },
    );
  }
}
