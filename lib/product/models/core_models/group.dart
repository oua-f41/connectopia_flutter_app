import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'event.dart';
import 'user_groups.dart';

class Group{
  String? id;
  String? name;
  String? description;
  String? categoryId;
  String? userId;
  DateTime? createdAt;
  Category? category;
  User? owner;
  List<Event>? events;
  List<UserGroups>? userGroups;

  Group({this.id, this.name, this.description, this.categoryId, this.userId, this.createdAt, this.category, this.owner, this.events, this.userGroups});
}