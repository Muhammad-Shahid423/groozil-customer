import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String id,
    required String userId,
    required String label,
    required String street,
    required String district,
    required String city,
    required String building,
    required String apartment,
    required String floor,
    required double latitude,
    required double longitude,
    required String additionalDetails,
    required bool isDefault,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Address;

  const Address._();

  String get fullAddress {
    final parts = <String>[];
    
    if (building.isNotEmpty) parts.add(building);
    if (apartment.isNotEmpty) parts.add('Apt $apartment');
    if (floor.isNotEmpty) parts.add('Floor $floor');
    if (street.isNotEmpty) parts.add(street);
    if (district.isNotEmpty) parts.add(district);
    if (city.isNotEmpty) parts.add(city);
    
    return parts.join(', ');
  }

  String get shortAddress {
    final parts = <String>[];
    
    if (district.isNotEmpty) parts.add(district);
    if (city.isNotEmpty) parts.add(city);
    
    return parts.join(', ');
  }
}
