// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationRequest _$NotificationRequestFromJson(Map<String, dynamic> json) =>
    NotificationRequest(
      body: json['body'] as String?,
      title: json['title'] as String?,
      id: json['id'] as String?,
      topic: json['topic'] as String?,
    );

Map<String, dynamic> _$NotificationRequestToJson(
        NotificationRequest instance) =>
    <String, dynamic>{
      'body': instance.body,
      'title': instance.title,
      'id': instance.id,
      'topic': instance.topic,
    };
