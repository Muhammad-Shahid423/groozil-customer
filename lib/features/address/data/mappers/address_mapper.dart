import 'package:groozil_app/features/address/data/models/address_model.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';

extension AddressModelX on AddressModel {
  Address toEntity() {
    return Address(
      id: id,
      userId: userId,
      label: label,
      street: street,
      district: district,
      city: city,
      building: building,
      apartment: apartment,
      floor: floor,
      latitude: latitude,
      longitude: longitude,
      additionalDetails: additionalDetails,
      isDefault: isDefault,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
