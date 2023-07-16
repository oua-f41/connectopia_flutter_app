import 'package:connectopia/app/connectopia_app_cubit.dart';
import 'package:connectopia/product/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../app/base_cubit.dart';
import '../../../../product/di/injection.dart';
import '../../../../product/models/core_models/event.dart';
import '../../../event/data/repository/event_repository.dart';
import 'view_model/maps_view_model.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class MapsCubit extends BaseCubit<MapsViewModel> {
  MapsCubit() : super(MapsViewModel());

  late final IEventRepository _eventRepository;

  void init() async {
    _eventRepository = getIt.get<IEventRepository>();
    await getEvents();
  }

  void getAllEvents() async {
    if (getIt.get<ConnectopiaAppCubit>().state.isLoading) return;
    emit(state.copyWith(mapSelectedJustCity: false));
  }

  void getCityEvents() async {
    if (getIt.get<ConnectopiaAppCubit>().state.isLoading) return;
    emit(state.copyWith(mapSelectedJustCity: true));
  }

  Future<void> refresh() async {
    await getEvents();
  }

  Future<void> getEvents() async {
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: true);
    await getIt.get<ConnectopiaAppCubit>().getCurrentPosition();
    try {
      if (getIt.get<ConnectopiaAppCubit>().state.currentCity?.id != null) {
        var events = await _eventRepository.getByCityId(
            getIt.get<ConnectopiaAppCubit>().state.currentCity?.id ?? "");
        emit(state.copyWith(eventsByCity: events));
        getCityEventMarkers();
      } else {
        var events = await _eventRepository.getAll();
        emit(state.copyWith(eventsByCity: events));
      }
    } catch (e) {
      print(e);
    }
    try {
      List<Event>? events = await _eventRepository.getAll();
      emit(state.copyWith(allEvents: events));
      getAllEventMarkers();
    } catch (e) {
      print(e);
    }
    getIt.get<ConnectopiaAppCubit>().changeIsLoading(isLoading: false);
  }

  void selectEvent(Event event) {
    emit(state.copyWith(selectedEvent: event));
  }

  void clearSelectedEvent() {
    emit(MapsViewModel(
      allEvents: state.allEvents,
      eventsByCity: state.eventsByCity,
      isLoading: state.isLoading,
      mapSelectedJustCity: state.mapSelectedJustCity,
      allMarkers: state.allMarkers,
      cityMarkers: state.cityMarkers,
    ));
  }

  Future<void> getAllEventMarkers() async {
    Future.forEach(
        state.allEvents!,
        (e) async => {
              addToAllEventMap(Marker(
                  onTap: () => selectEvent(e),
                  markerId: MarkerId(e.id ?? ""),
                  position: LatLng(double.parse(e.eventLat ?? "0.0"),
                      double.parse(e.eventLng ?? "0.0")),
                  icon: await Container(
                    child: e.group?.iconUrl != null
                        ? ClipOval(
                            child: Image.network(
                              e.group!.iconUrl!,
                              width: 100,
                              height: 100,
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                              ImageConstants.defaultGroupPhoto.imagePath,
                              width: 100,
                              height: 100,
                            ),
                          ),
                  ).toBitmapDescriptor(
                      logicalSize: const Size(250, 250),
                      imageSize: const Size(250, 250))))
            });
  }

  Future<void> addToAllEventMap(Marker marker) async {
    emit(state.copyWith(allMarkers: {...state.allMarkers ?? {}, marker}));
  }

  Future<void> getCityEventMarkers() async {
    Future.forEach(
        state.eventsByCity!,
        (e) async => {
              addToCityEventMap(Marker(
                  onTap: () => selectEvent(e),
                  markerId: MarkerId(e.id ?? ""),
                  position: LatLng(double.parse(e.eventLat ?? "0.0"),
                      double.parse(e.eventLng ?? "0.0")),
                  icon: await Container(
                    child: e.group?.iconUrl != null
                        ? ClipOval(
                            child: Image.network(
                              e.group!.iconUrl!,
                              width: 100,
                              height: 100,
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                              ImageConstants.defaultGroupPhoto.imagePath,
                              width: 100,
                              height: 100,
                            ),
                          ),
                  ).toBitmapDescriptor(
                      logicalSize: const Size(250, 250),
                      imageSize: const Size(250, 250))))
            });
  }

  Future<void> addToCityEventMap(Marker marker) async {
    emit(state.copyWith(cityMarkers: {...state.cityMarkers ?? {}, marker}));
  }
}
