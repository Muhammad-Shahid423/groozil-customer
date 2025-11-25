// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      label: json['label'] as String,
      street: json['street'] as String,
      district: json['district'] as String,
      city: json['city'] as String,
      building: json['building'] as String,
      apartment: json['apartment'] as String,
      floor: json['floor'] as String,
      latitude: _stringToDouble(json['latitude']),
      longitude: _stringToDouble(json['longitude']),
      additionalDetails: json['additionalDetails'] as String,
      isDefault: json['isDefault'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'label': instance.label,
      'street': instance.street,
      'district': instance.district,
      'city': instance.city,
      'building': instance.building,
      'apartment': instance.apartment,
      'floor': instance.floor,
      'latitude': _doubleToString(instance.latitude),
      'longitude': _doubleToString(instance.longitude),
      'additionalDetails': instance.additionalDetails,
      'isDefault': instance.isDefault,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
