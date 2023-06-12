import 'event.dart';
import 'user.dart';

class EventAttendees {
  String? id;
  String? eventId;
  String? userId;
  DateTime? createdAt;
  Event? event;
  User? user;

  EventAttendees({this.id, this.eventId, this.userId, this.createdAt});
}
