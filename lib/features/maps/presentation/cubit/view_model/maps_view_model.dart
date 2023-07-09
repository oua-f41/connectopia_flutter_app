import 'package:connectopia/core/presentation/base_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../product/models/core_models/event.dart';

class MapsViewModel extends BaseViewModel {
  List<Event>? allEvents;
  List<Event>? eventsByCity;
  Event? selectedEvent;
  Set<Marker>? markers;
  bool mapSelectedJustCity;

  MapsViewModel(
      {this.allEvents,
      this.eventsByCity,
      this.selectedEvent,
      super.isLoading,
      this.markers,
      this.mapSelectedJustCity = true});

  MapsViewModel copyWith({
    List<Event>? allEvents,
    List<Event>? eventsByCity,
    Event? selectedEvent,
    Set<Marker>? markers,
    bool? isLoading,
    bool? mapSelectedJustCity,
  }) {
    return MapsViewModel(
      allEvents: allEvents ?? this.allEvents,
      eventsByCity: eventsByCity ?? this.eventsByCity,
      selectedEvent: selectedEvent ?? this.selectedEvent,
      isLoading: isLoading ?? this.isLoading,
      markers: markers ?? this.markers,
      mapSelectedJustCity: mapSelectedJustCity ?? this.mapSelectedJustCity,
    );
  }

  @override
  List<Object?> get props => [
        allEvents,
        eventsByCity,
        selectedEvent,
        isLoading,
        markers,
        mapSelectedJustCity
      ];
}
