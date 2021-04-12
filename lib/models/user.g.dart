// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['userId'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    mobile: json['mobile'] as String,
    role: json['role'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'email': instance.email,
      'mobile': instance.mobile,
      'role': instance.role,
    };
