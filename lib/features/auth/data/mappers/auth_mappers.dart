import 'package:groozil_app/features/auth/data/models/auth_response_model.dart';
import 'package:groozil_app/features/auth/data/models/user_model.dart';
import 'package:groozil_app/features/auth/domain/entities/auth_response.dart';
import 'package:groozil_app/features/auth/domain/entities/user.dart';

extension UserModelX on UserModel {
  User toEntity() {
    return User(
      id: id,
      phone: phone,
      email: email,
      name: name,
      role: role,
      status: status,
      language: language,
      isGuest: isGuest,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension AuthResponseModelX on AuthResponseModel {
  AuthResponse toEntity() {
    return AuthResponse(
      user: user.toEntity(),
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
