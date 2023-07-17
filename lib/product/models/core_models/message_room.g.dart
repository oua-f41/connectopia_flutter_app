// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageRoom _$MessageRoomFromJson(Map<String, dynamic> json) => MessageRoom(
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$MessageRoomToJson(MessageRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'users': instance.users,
      'messages': instance.messages,
    };
