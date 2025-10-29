/// Utility class for common data checking and validation operations
class DataChecker {
  DataChecker._(); // Private constructor to prevent instantiation

  // ==================== String Checks ====================

  /// Check if string is null or empty
  static bool isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  /// Check if string is not null and not empty
  static bool isNotEmpty(String? value) {
    return value != null && value.isNotEmpty;
  }

  /// Check if string is null, empty, or contains only whitespace
  static bool isBlank(String? value) {
    return value == null || value.trim().isEmpty;
  }

  /// Check if string is not null, not empty, and not just whitespace
  static bool isNotBlank(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  // ==================== Number Checks ====================

  /// Check if value can be parsed as integer
  static bool isInt(dynamic value) {
    if (value == null) return false;
    if (value is int) return true;
    if (value is String) return int.tryParse(value) != null;
    return false;
  }

  /// Check if value can be parsed as double
  static bool isDouble(dynamic value) {
    if (value == null) return false;
    if (value is double) return true;
    if (value is num) return true;
    if (value is String) return double.tryParse(value) != null;
    return false;
  }

  /// Check if value is a valid number (int or double)
  static bool isNumeric(dynamic value) {
    if (value == null) return false;
    if (value is num) return true;
    if (value is String) return double.tryParse(value) != null;
    return false;
  }

  /// Check if number is zero
  static bool isZero(num? value) {
    return value == 0;
  }

  /// Check if number is positive (> 0)
  static bool isPositive(num? value) {
    return value != null && value > 0;
  }

  /// Check if number is negative (< 0)
  static bool isNegative(num? value) {
    return value != null && value < 0;
  }

  /// Check if number is within a range (inclusive)
  static bool isInRange(num? value, num min, num max) {
    if (value == null) return false;
    return value >= min && value <= max;
  }

  // ==================== Collection Checks ====================

  /// Check if list is null or empty
  static bool isListEmpty<T>(List<T>? list) {
    return list == null || list.isEmpty;
  }

  /// Check if list is not null and not empty
  static bool isListNotEmpty<T>(List<T>? list) {
    return list != null && list.isNotEmpty;
  }

  /// Check if map is null or empty
  static bool isMapEmpty<K, V>(Map<K, V>? map) {
    return map == null || map.isEmpty;
  }

  /// Check if map is not null and not empty
  static bool isMapNotEmpty<K, V>(Map<K, V>? map) {
    return map != null && map.isNotEmpty;
  }

  // ==================== Type Checks ====================

  /// Check if value is null
  static bool isNull(dynamic value) {
    return value == null;
  }

  /// Check if value is not null
  static bool isNotNull(dynamic value) {
    return value != null;
  }

  /// Check if value is of specific type T
  static bool isType<T>(dynamic value) {
    return value is T;
  }

  // ==================== Boolean Checks ====================

  /// Check if value is true
  static bool isTrue(bool? value) {
    return value == true;
  }

  /// Check if value is false
  static bool isFalse(bool? value) {
    return value == false;
  }

  /// Check if value is null or false
  static bool isNullOrFalse(bool? value) {
    return value == null || value == false;
  }

  // ==================== Email & Phone Checks ====================

  /// Check if string is a valid email format (basic check)
  static bool isEmail(String? value) {
    if (isEmpty(value)) return false;
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(value!);
  }

  /// Check if string is a valid phone number format (basic check)
  static bool isPhone(String? value) {
    if (isEmpty(value)) return false;
    final phoneRegex = RegExp(r'^\+?[\d\s-]{8,}$');
    return phoneRegex.hasMatch(value!);
  }

  /// Check if string is a valid URL format (basic check)
  static bool isUrl(String? value) {
    if (isEmpty(value)) return false;
    final urlRegex = RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    );
    return urlRegex.hasMatch(value!);
  }

  // ==================== Date/Time Checks ====================

  /// Check if DateTime is in the past
  static bool isPast(DateTime? date) {
    if (date == null) return false;
    return date.isBefore(DateTime.now());
  }

  /// Check if DateTime is in the future
  static bool isFuture(DateTime? date) {
    if (date == null) return false;
    return date.isAfter(DateTime.now());
  }

  /// Check if DateTime is today
  static bool isToday(DateTime? date) {
    if (date == null) return false;
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  // ==================== Comparison Checks ====================

  /// Check if two values are equal (null-safe)
  static bool areEqual(dynamic a, dynamic b) {
    return a == b;
  }

  /// Check if two values are not equal (null-safe)
  static bool areNotEqual(dynamic a, dynamic b) {
    return a != b;
  }

  /// Check if all values in list are not null
  static bool allNotNull(List<dynamic> values) {
    return values.every((value) => value != null);
  }

  /// Check if any value in list is not null
  static bool anyNotNull(List<dynamic> values) {
    return values.any((value) => value != null);
  }

  /// Check if all values in list are null
  static bool allNull(List<dynamic> values) {
    return values.every((value) => value == null);
  }

  /// Check if any value in list is null
  static bool anyNull(List<dynamic> values) {
    return values.any((value) => value == null);
  }
}
