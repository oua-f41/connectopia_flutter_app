import 'package:connectopia/core/presentation/base_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../product/models/core_models/event.dart';

class MapsViewModel extends BaseViewModel {
  List<Event>? allEvents;
  List<Event>? eventsByCity;
  Event? selectedEvent;
  Set<Marker>? allMarkers;
  Set<Marker>? cityMarkers;
  bool mapSelectedJustCity;

  MapsViewModel(
      {this.allEvents,
      this.eventsByCity,
      this.selectedEvent,
      super.isLoading,
      this.allMarkers,
      this.cityMarkers,
      this.mapSelectedJustCity = true});

  MapsViewModel copyWith({
    List<Event>? allEvents,
    List<Event>? eventsByCity,
    Event? selectedEvent,
    Set<Marker>? allMarkers,
    Set<Marker>? cityMarkers,
    bool? isLoading,
    bool? mapSelectedJustCity,
  }) {
    return MapsViewModel(
      allEvents: allEvents ?? this.allEvents,
      eventsByCity: eventsByCity ?? this.eventsByCity,
      selectedEvent: selectedEvent ?? this.selectedEvent,
      isLoading: isLoading ?? this.isLoading,
      allMarkers: allMarkers ?? this.allMarkers,
      cityMarkers: cityMarkers ?? this.cityMarkers,
      mapSelectedJustCity: mapSelectedJustCity ?? this.mapSelectedJustCity,
    );
  }

  @override
  List<Object?> get props => [
        allEvents,
        eventsByCity,
        selectedEvent,
        isLoading,
        allMarkers,
        cityMarkers,
        mapSelectedJustCity
      ];
}
