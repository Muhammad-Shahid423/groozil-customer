import 'package:fpdart/fpdart.dart';
import 'package:groozil_app/core/errors/failures.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<Address>>> getAddresses();
  Future<Either<Failure, Address>> getAddressById(String id);
  Future<Either<Failure, Address>> addAddress(AddressParams params);
  Future<Either<Failure, Address>> updateAddress(String id, AddressParams params);
  Future<Either<Failure, void>> deleteAddress(String id);
  Future<Either<Failure, void>> setDefaultAddress(String id);
}

class AddressParams {
  AddressParams({
    required this.label,
    required this.street,
    required this.district,
    required this.city,
    required this.building,
    required this.apartment,
    required this.floor,
    required this.latitude,
    required this.longitude,
    required this.additionalDetails,
    required this.isDefault,
  });

  final String label;
  final String street;
  final String district;
  final String city;
  final String building;
  final String apartment;
  final String floor;
  final double latitude;
  final double longitude;
  final String additionalDetails;
  final bool isDefault;

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'street': street,
      'district': district,
      'city': city,
      'building': building,
      'apartment': apartment,
      'floor': floor,
      'latitude': latitude,
      'longitude': longitude,
      'additionalDetails': additionalDetails,
      'isDefault': isDefault,
    };
  }
}
