import 'package:connectopia/app/connectopia_app_cubit.dart';

import '../../../../app/base_cubit.dart';
import '../../../../product/di/injection.dart';
import '../../../../product/models/core_models/event.dart';
import '../../../event/data/repository/event_repository.dart';
import 'view_model/maps_view_model.dart';

class MapsCubit extends BaseCubit<MapsViewModel> {
  MapsCubit() : super(MapsViewModel());

  late final IEventRepository _eventRepository;

  void init() async {
    _eventRepository = getIt.get<IEventRepository>();
    getEvents();
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
    getIt.get<ConnectopiaAppCubit>().changeIsLoading();
    await getIt.get<ConnectopiaAppCubit>().getCurrentPosition();
    try {
      if (getIt.get<ConnectopiaAppCubit>().state.currentCity?.id != null) {
        var events = await _eventRepository.getByCityId(
            getIt.get<ConnectopiaAppCubit>().state.currentCity?.id ?? "");
        emit(state.copyWith(eventsByCity: events));
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
    } catch (e) {
      print(e);
    }
    getIt.get<ConnectopiaAppCubit>().changeIsLoading();
  }

  void selectEvent(Event event) {
    emit(state.copyWith(selectedEvent: event));
  }

  void clearSelectedEvent() {
    emit(MapsViewModel(
        allEvents: state.allEvents,
        eventsByCity: state.eventsByCity,
        isLoading: state.isLoading,
        mapSelectedJustCity: state.mapSelectedJustCity));
  }

  /* Future<void> deneme() async {
    /* BitmapDescriptor a = await MarkerIcon.downloadResizePictureCircle(
        'https://thegpscoordinates.net/photos/la/tehran_iran_5u679ezi8f.jpg',
        size: 150,
        addBorder: true,
        borderColor: Colors.white,
        borderSize: 15); */
    Set<Marker>? b = state.events!
        .map((e) => Marker(
            onTap: () => selectEvent(e),
            markerId: MarkerId(e.id ?? ""),
            position: LatLng(double.parse(e.eventLat ?? "0.0"),
                double.parse(e.eventLng ?? "0.0")),
            icon: BitmapDescriptor.defaultMarker))
        .toSet();
    emit(state.copyWith(markers: b));
  } */
}
