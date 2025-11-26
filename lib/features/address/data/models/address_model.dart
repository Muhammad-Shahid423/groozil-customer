import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String id,
    required String userId,
    required String label,
    required String street,
    required String district,
    required String city,
    required String building,
    required String apartment,
    required String floor,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double latitude,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double longitude,
    required String additionalDetails,
    required bool isDefault,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

// Helper functions to handle string/double conversion
double _stringToDouble(dynamic value) {
  if (value is String) {
    return double.tryParse(value) ?? 0.0;
  }
  if (value is num) {
    return value.toDouble();
  }
  return 0;
}

String _doubleToString(double value) {
  return value.toString();
}
