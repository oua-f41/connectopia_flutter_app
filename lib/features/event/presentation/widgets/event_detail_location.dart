import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectopia/features/event/presentation/cubit/event_detail_cubit.dart';
import 'package:connectopia/features/event/presentation/cubit/view_model/event_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDetailLocation extends StatelessWidget {
  const EventDetailLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailViewModel>(
      builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      AppLocalizations.of(context)!.whereEvent,
                      maxFontSize: 25,
                      minFontSize: 12,
                      style: context.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: AutoSizeText(
                        AppLocalizations.of(context)!.viewOnMap,
                        style: TextStyle(color: context.colorScheme.secondary),
                      ))
                ],
              ),
              state.isLoading
                  ? Container(
                      padding: context.verticalPaddingNormal,
                      child: const SkeletonLine())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: context.onlyTopPaddingLow,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 25,
                                color: context.colorScheme.outline,
                              ),
                              Container(
                                padding: context.onlyLeftPaddingLow,
                                width: context.dynamicWidth(0.8),
                                child: Text(state.event?.eventAddress ?? "",
                                    style: context.textTheme.titleSmall),
                              ),
                            ],
                          ),
                        ),
                        /*  */
                      ],
                    ),
              Container(
                margin: context.onlyTopPaddingNormal,
                height: context.dynamicWidth(0.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: context.colorScheme.primary,
                ),
                child: state.isLoading
                    ? SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: context.dynamicWidth(0.9)),
                      )
                    : GoogleMap(
                        cameraTargetBounds: CameraTargetBounds.unbounded,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                                double.parse(state.event?.eventLat ?? "0"),
                                double.parse(state.event?.eventLng ?? "0")),
                            zoom: 15.0),
                        compassEnabled: false,
                        zoomControlsEnabled: false,
                        markers: {
                          Marker(
                            markerId: const MarkerId("1"),
                            position: LatLng(
                                double.parse(state.event?.eventLat ?? "0"),
                                double.parse(state.event?.eventLng ?? "0")),
                          )
                        },
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
