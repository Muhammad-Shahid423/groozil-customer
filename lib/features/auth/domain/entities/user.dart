import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String role,
    required String status,
    required String language,
    required bool isGuest,
    String? phone,
    String? email,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;
}
