// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as String,
      json['email'] as String,
      json['name'] as String,
      json['dob'] as String,
      json['avatar'] as String,
      json['skills'] as String,
      json['position'] as String,
      json['joinDate'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'dob': instance.dob,
      'avatar': instance.avatar,
      'skills': instance.skills,
      'position': instance.position,
      'joinDate': instance.joinDate
    };
