// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationRequest _$NotificationRequestFromJson(Map<String, dynamic> json) =>
    NotificationRequest(
      topic: json['topic'] as String?,
      body: json['body'] as String?,
      title: json['title'] as String?,
      route: json['route'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$NotificationRequestToJson(
        NotificationRequest instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'body': instance.body,
      'title': instance.title,
      'route': instance.route,
      'id': instance.id,
    };
