import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    @Default('user') String role,
    @Default('') String status,
    @Default('en') String language,
    String? phone,
    String? email,
    String? name,
    String? googleId,
    String? appleId,
    @Default(false) bool isGuest,
    // @Default(<dynamic>[]) List<dynamic> addresses,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
