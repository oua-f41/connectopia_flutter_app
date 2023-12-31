import 'package:connectopia/features/maps/presentation/extensions/map_marker_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../app/connectopia_app_cubit.dart';
import '../cubit/maps_cubit.dart';

class EventMap extends StatelessWidget {
  const EventMap({super.key});

  @override
  Widget build(BuildContext context) {
    final mapsState = context.watch<MapsCubit>().state;
    return BlocBuilder<ConnectopiaAppCubit, ConnectopiaAppViewModel>(
      builder: (context, state) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(state.currentLocation?.latitude ?? 40,
                  state.currentLocation?.longitude ?? 33),
              zoom: state.currentLocation != null ? 12.0 : 0.0),
          compassEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          circles: {
            Circle(
                circleId: const CircleId("1"),
                center: LatLng(state.currentLocation?.latitude ?? 0,
                    state.currentLocation?.longitude ?? 0),
                radius: 10000,
                fillColor: Colors.blue.withOpacity(0.1),
                strokeColor: Colors.blue,
                strokeWidth: 1)
          },
          myLocationButtonEnabled: false,
          markers: mapsState.mapSelectedJustCity
              ? mapsState.cityMarkers?.toSet() ??
                  mapsState.eventsByCity.toMapMarkers(context)
              : mapsState.allMarkers?.toSet() ??
                  mapsState.allEvents.toMapMarkers(context),
        );
      },
    );
  }
}
