class ResponseCode {
  // HTTP Status Codes
  static const int success = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int badRequest = 400;
  static const int unAuthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int conflict = 409;
  static const int unsupportedMediaType = 415;
  static const int dataValidationFailed = 422;
  static const int tooManyRequests = 429;
  static const int internalServerError = 500;
  static const int connectionError = 502;

  // Local Status Codes (for app-level errors)
  static const int reAuthenticateRequired = -43;
  static const int cancel = -500;
  static const int cacheError = -501;
  static const int noInternetConnection = -502;
  static const int unKnown = -503;
  static const int apiAuthenticationFailed = 401;
}
