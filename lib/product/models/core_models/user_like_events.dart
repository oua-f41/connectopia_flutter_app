import 'event.dart';
import 'user.dart';

class UserLikeEvents {
  String? id;
  String? userId;
  String? eventId;
  DateTime? createdAt;
  Event? event;
  User? user;

  UserLikeEvents({this.id, this.userId, this.eventId, this.createdAt});
}
