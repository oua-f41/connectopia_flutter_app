import 'package:connectopia/core/presentation/base_view_model.dart';

import '../../../../../product/models/core_models/event.dart';

class HomeViewModel extends BaseViewModel {
  String? title;
  List<Event>? events;
  bool eventsLoading;
  List<Event>? eventsOnCity;
  bool eventsOnCityLoading;
  List<Event>? otherEvents;
  bool otherEventsLoading;

  HomeViewModel(
      {super.isLoading,
      this.title,
      this.events,
      this.eventsOnCity,
      this.eventsOnCityLoading = false,
      this.otherEvents,
      this.otherEventsLoading = false,
      this.eventsLoading = false});

  HomeViewModel copyWith({
    bool? isLoading,
    String? title,
    List<Event>? events,
    bool? eventsLoading,
    List<Event>? eventsOnCity,
    bool? eventsOnCityLoading,
    List<Event>? otherEvents,
    bool? otherEventsLoading,
  }) {
    return HomeViewModel(
      isLoading: isLoading ?? this.isLoading,
      title: title ?? this.title,
      events: events ?? this.events,
      eventsLoading: eventsLoading ?? this.eventsLoading,
      eventsOnCity: eventsOnCity ?? this.eventsOnCity,
      eventsOnCityLoading: eventsOnCityLoading ?? this.eventsOnCityLoading,
      otherEvents: otherEvents ?? this.otherEvents,
      otherEventsLoading: otherEventsLoading ?? this.otherEventsLoading,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, title, events, eventsLoading, eventsOnCity, eventsOnCityLoading, otherEvents, otherEventsLoading];
}
