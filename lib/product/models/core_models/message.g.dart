// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String?,
      senderId: json['senderId'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };
