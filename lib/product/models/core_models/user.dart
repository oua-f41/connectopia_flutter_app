import 'event_attendees.dart';
import 'group.dart';
import 'user_groups.dart';
import 'user_like_events.dart';

class User {
  String? id;
  String? userName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? profilePhotoUrl;
  String? about;
  List<Group>? groups;
  List<UserGroups>? userGroups;
  List<EventAttendees>? eventAttendees;
  List<UserLikeEvents>? userLikeEvents;
}
