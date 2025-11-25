// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  role: json['role'] as String? ?? 'user',
  status: json['status'] as String? ?? '',
  language: json['language'] as String? ?? 'en',
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  name: json['name'] as String?,
  googleId: json['googleId'] as String?,
  appleId: json['appleId'] as String?,
  isGuest: json['isGuest'] as bool? ?? false,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'status': instance.status,
      'language': instance.language,
      'phone': instance.phone,
      'email': instance.email,
      'name': instance.name,
      'googleId': instance.googleId,
      'appleId': instance.appleId,
      'isGuest': instance.isGuest,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
