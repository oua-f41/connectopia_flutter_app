import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../product/models/core_models/event.dart';
import '../cubit/maps_cubit.dart';

extension MapMarkerExtension on List<Event>? {
  Set<Marker> toMapMarkers(BuildContext context) {
    return this
            ?.map((e) => Marker(
                onTap: () => context.read<MapsCubit>().selectEvent(e),
                markerId: MarkerId(e.id ?? ""),
                position: LatLng(double.parse(e.eventLat ?? "0.0"),
                    double.parse(e.eventLng ?? "0.0")),
                icon: e.group?.userId == FirebaseAuth.instance.currentUser?.uid
                    ? BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen)
                    : BitmapDescriptor.defaultMarker))
            .toSet() ??
        {};
  }
}
