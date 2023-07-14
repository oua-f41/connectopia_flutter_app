import 'package:json_annotation/json_annotation.dart';

import 'message.dart';
part 'message_room.g.dart';

@JsonSerializable()
class MessageRoom {
  String? id;
  List<String>? users;
  List<Message>? messages;

  MessageRoom({this.users, this.messages, this.id});

  Map<String, dynamic> toJson() => _$MessageRoomToJson(this);

  factory MessageRoom.fromJson(Map<String, dynamic> json) =>
      _$MessageRoomFromJson(json);

  MessageRoom copyWith({
    String? id,
    List<String>? users,
    List<Message>? messages,
  }) {
    return MessageRoom(
      id: id ?? this.id,
      users: users ?? this.users,
      messages: messages ?? this.messages,
    );
  }
}
