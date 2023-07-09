// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupRequest _$UserGroupRequestFromJson(Map<String, dynamic> json) =>
    UserGroupRequest(
      userId: json['userId'] as String?,
      groupId: json['groupId'] as String?,
    );

Map<String, dynamic> _$UserGroupRequestToJson(UserGroupRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'groupId': instance.groupId,
    };
