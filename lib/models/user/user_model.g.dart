// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      email: json['email'] as String,
      name: json['name'] as String,
      phone_number: json['phone_number'] as String,
      profile_picture: json['profile_picture'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      email_verified: json['email_verified'] as bool,
      phone_verified: json['phone_verified'] as bool,
      is_staff: json['is_staff'] as bool,
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone_number': instance.phone_number,
      'profile_picture': instance.profile_picture,
      'age': instance.age,
      'gender': instance.gender,
      'email_verified': instance.email_verified,
      'phone_verified': instance.phone_verified,
      'is_staff': instance.is_staff,
      'isActive': instance.isActive,
    };
