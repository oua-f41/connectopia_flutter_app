import 'package:auto_route/auto_route.dart';
import 'package:connectopia/app/app_router.dart';
import 'package:connectopia/app/connectopia_app_cubit.dart';
import 'package:connectopia/features/maps/presentation/cubit/maps_cubit.dart';
import 'package:connectopia/product/widgets/title_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constants/image_constants.dart';
import '../cubit/view_model/maps_view_model.dart';

@RoutePage()
class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    MapsViewModel mapsState = context.watch<MapsCubit>().state;
    return BlocBuilder<ConnectopiaAppCubit, ConnectopiaAppViewModel>(
      builder: (context, state) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBar(),
            bottomNavigationBar: state.isLoading == false
                ? mapsState.selectedEvent == null
                    ? Container(
                        padding: context.paddingNormal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  disabledBackgroundColor:
                                      context.colorScheme.outlineVariant,
                                ),
                                onPressed: context
                                        .watch<MapsCubit>()
                                        .state
                                        .mapSelectedJustCity
                                    ? null
                                    : () {
                                        context
                                            .read<MapsCubit>()
                                            .getCityEvents();
                                      },
                                child: const Text("Your City")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  disabledBackgroundColor:
                                      context.colorScheme.outlineVariant,
                                ),
                                onPressed: context
                                        .watch<MapsCubit>()
                                        .state
                                        .mapSelectedJustCity
                                    ? () {
                                        context
                                            .read<MapsCubit>()
                                            .getAllEvents();
                                      }
                                    : null,
                                child: const Text("All Events")),
                          ],
                        ),
                      )
                    : const SizedBox()
                : const SizedBox(),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GoogleMap(
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
                      ? mapsState.eventsByCity
                              ?.map((e) => Marker(
                                  onTap: () =>
                                      context.read<MapsCubit>().selectEvent(e),
                                  markerId: MarkerId(e.id ?? ""),
                                  position: LatLng(
                                      double.parse(e.eventLat ?? "0.0"),
                                      double.parse(e.eventLng ?? "0.0")),
                                  icon: e.group?.userId == FirebaseAuth.instance.currentUser?.uid
                                      ? BitmapDescriptor.defaultMarkerWithHue(
                                          BitmapDescriptor.hueGreen)
                                      : BitmapDescriptor.defaultMarker))
                              .toSet() ??
                          {}
                      : mapsState.allEvents
                              ?.map((e) => Marker(
                                  onTap: () => context.read<MapsCubit>().selectEvent(e),
                                  markerId: MarkerId(e.id ?? ""),
                                  position: LatLng(double.parse(e.eventLat ?? "0.0"), double.parse(e.eventLng ?? "0.0")),
                                  icon: e.group?.userId == FirebaseAuth.instance.currentUser?.uid ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen) : BitmapDescriptor.defaultMarker))
                              .toSet() ??
                          {},
                ),
                AnimatedCrossFade(
                  crossFadeState: mapsState.selectedEvent != null
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: context.durationLow,
                  firstCurve: Curves.easeIn,
                  secondCurve: Curves.easeOut,
                  secondChild: const SizedBox(),
                  firstChild: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (mapsState.selectedEvent == null) return;
                          context.router.push(EventDetailRoute(
                              event: mapsState.selectedEvent!));
                        },
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                              height: context.dynamicHeight(0.25),
                              width: context.dynamicWidth(0.9),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: context.dynamicWidth(0.3),
                                      child: mapsState
                                                  .selectedEvent
                                                  ?.eventPhotoUrl
                                                  .isNotNullOrNoEmpty ==
                                              true
                                          ? Image.network(
                                              mapsState.selectedEvent
                                                      ?.eventPhotoUrl ??
                                                  "",
                                              fit: BoxFit.cover,
                                              height:
                                                  context.dynamicHeight(0.25),
                                            )
                                          : const Center(
                                              child: Icon(
                                                Icons.image,
                                                size: 50,
                                              ),
                                            )),
                                  Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: context.dynamicWidth(0.5),
                                        height: context.dynamicHeight(0.058),
                                        alignment: Alignment.topLeft,
                                        padding: context.paddingLow,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: TitleText(
                                            text:
                                                mapsState.selectedEvent?.name ??
                                                    "",
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: context.horizontalPaddingLow,
                                        width: context.dynamicWidth(0.5),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          mapsState
                                                  .selectedEvent?.description ??
                                              "",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.dynamicWidth(0.5), 
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Row(children: [
                                                      Container(
                                                        padding:
                                                            context.paddingLow,
                                                        child: ClipOval(
                                                          child: mapsState
                                                                      .selectedEvent
                                                                      ?.group
                                                                      ?.iconUrl
                                                                      .isNotNullOrNoEmpty ==
                                                                  true
                                                              ? Image.network(
                                                                  mapsState
                                                                          .selectedEvent
                                                                          ?.group
                                                                          ?.iconUrl ??
                                                                      "",
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  height: 20,
                                                                  width: 20,
                                                                )
                                                              : Image.asset(
                                                                  ImageConstants
                                                                      .defaultGroupPhoto
                                                                      .imagePath,
                                                                  height: 20,
                                                                  width: 20,
                                                                ),
                                                        ),
                                                      ),
                                                      Text(
                                                        mapsState.selectedEvent
                                                                ?.group?.name ??
                                                            "",
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                              ),
                                              const Text(" • "),
                                              Text(
                                                mapsState.selectedEvent?.group
                                                        ?.category?.name ??
                                                    "",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: context.horizontalPaddingLow,
                                          width: context.dynamicWidth(0.6),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(DateFormat("dd/MM/yyyy")
                                                  .format(mapsState
                                                          .selectedEvent
                                                          ?.eventDate ??
                                                      DateTime.now())),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    if (mapsState
                                                            .selectedEvent ==
                                                        null) return;
                                                    context.router.push(
                                                        EventDetailRoute(
                                                            event: mapsState
                                                                .selectedEvent!));
                                                  },
                                                  child: const Text(
                                                      "Go To Detail"))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              )),
                        ),
                      ),
                      mapsState.selectedEvent != null
                          ? IconButton(
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
                              ))
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
