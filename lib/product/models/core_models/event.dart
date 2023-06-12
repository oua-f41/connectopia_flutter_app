import 'package:f41/product/models/core_models/user_like_events.dart';

import 'event_attendees.dart';
import 'group.dart';

class Event{
  String? id;
  String? name;
  String? description;
  String? eventPhotoUrl;
  String? location;
  DateTime? eventDate;
  String? eventLocation;
  String? eventLat;
  String? eventLng;
  String? groupId;
  String? userId;
  DateTime? createdAt;
  Group? group;
  List<EventAttendees>? eventAttendees;
  List<UserLikeEvents>? userLikeEvents;


  Event({this.id, this.name, this.description, this.eventPhotoUrl, this.location, this.eventDate, this.eventLocation, this.eventLat, this.eventLng, this.groupId, this.userId, this.createdAt, this.group, this.eventAttendees, this.userLikeEvents});

  
}