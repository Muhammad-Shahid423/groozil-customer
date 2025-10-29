/// Extension methods for String type checking and parsing
extension StringCheckers on String? {
  /// Check if string is null or empty
  bool get isNullOrEmpty => this == null || this!.isEmpty || this == 'null';

  /// Check if string is not null and not empty
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Check if string is null, empty, or contains only whitespace
  bool get isNullOrWhiteSpace =>
      this == null || this!.trim().isEmpty;

  /// Check if string is not null, not empty, and not just whitespace
  bool get isNotNullOrWhiteSpace => !isNullOrWhiteSpace;

  /// Safely parse string to int, returns null if parsing fails
  int? toIntOrNull() {
    if (this == null) return null;
    return int.tryParse(this!);
  }

  /// Safely parse string to double, returns null if parsing fails
  double? toDoubleOrNull() {
    if (this == null) return null;
    return double.tryParse(this!);
  }

  /// Safely parse string to bool, returns null if parsing fails
  /// Accepts: 'true', '1', 'yes' as true
  /// Accepts: 'false', '0', 'no' as false
  bool? toBoolOrNull() {
    if (this == null) return null;
    final lower = this!.toLowerCase().trim();
    if (lower == 'true' || lower == '1' || lower == 'yes') return true;
    if (lower == 'false' || lower == '0' || lower == 'no') return false;
    return null;
  }

  /// Get string or return default value if null
  String orDefault([String defaultValue = '']) {
    return this ?? defaultValue;
  }

  /// Check if string is a valid number (int or double)
  bool get isNumeric {
    if (this == null) return false;
    return double.tryParse(this!) != null;
  }

  /// Check if string is a valid integer
  bool get isInt {
    if (this == null) return false;
    return int.tryParse(this!) != null;
  }

  /// Check if string is a valid double
  bool get isDouble {
    if (this == null) return false;
    return double.tryParse(this!) != null;
  }

  /// Capitalize first letter of string
  String? get capitalize {
    if (this == null || this!.isEmpty) return this;
    return this![0].toUpperCase() + this!.substring(1);
  }

  /// Convert string to title case (capitalize each word)
  String? get toTitleCase {
    if (this == null || this!.isEmpty) return this;
    return this!
        .split(' ')
        .map((word) => word.isEmpty ? word : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}

/// Extension methods for nullable types checking
extension NullableCheckers<T> on T? {
  /// Check if value is null
  bool get isNull => this == null;

  /// Check if value is not null
  bool get isNotNull => this != null;

  /// Get value or return default if null
  T orDefault(T defaultValue) {
    return this ?? defaultValue;
  }
}

/// Extension methods for List checking
extension ListCheckers<T> on List<T>? {
  /// Check if list is null or empty
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Check if list is not null and not empty
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Get length or 0 if null
  int get lengthOrZero => this?.length ?? 0;

  /// Get first element or null if list is null or empty
  T? get firstOrNull {
    if (isNullOrEmpty) return null;
    return this!.first;
  }

  /// Get last element or null if list is null or empty
  T? get lastOrNull {
    if (isNullOrEmpty) return null;
    return this!.last;
  }
}

/// Extension methods for Map checking
extension MapCheckers<K, V> on Map<K, V>? {
  /// Check if map is null or empty
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Check if map is not null and not empty
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Get length or 0 if null
  int get lengthOrZero => this?.length ?? 0;
}

/// Extension methods for num (int and double) checking
extension NumCheckers on num? {
  /// Check if number is null or zero
  bool get isNullOrZero => this == null || this == 0;

  /// Check if number is not null and not zero
  bool get isNotNullOrZero => !isNullOrZero;

  /// Check if number is positive (> 0)
  bool get isPositive => this != null && this! > 0;

  /// Check if number is negative (< 0)
  bool get isNegative => this != null && this! < 0;

  /// Check if number is zero
  bool get isZero => this == 0;

  /// Get value or return 0 if null
  num get orZero => this ?? 0;

  /// Get value or return default if null
  num orDefault(num defaultValue) {
    return this ?? defaultValue;
  }
}

/// Extension methods for int checking
extension IntCheckers on int? {
  /// Check if int is null or zero
  bool get isNullOrZero => this == null || this == 0;

  /// Check if int is not null and not zero
  bool get isNotNullOrZero => !isNullOrZero;

  /// Check if int is positive (> 0)
  bool get isPositive => this != null && this! > 0;

  /// Check if int is negative (< 0)
  bool get isNegative => this != null && this! < 0;

  /// Get value or return 0 if null
  int get orZero => this ?? 0;

  /// Get value or return default if null
  int orDefault(int defaultValue) {
    return this ?? defaultValue;
  }

  /// Check if int is even
  bool get isEven => this != null && this!.isEven;

  /// Check if int is odd
  bool get isOdd => this != null && this! % 2 != 0;
}

/// Extension methods for double checking
extension DoubleCheckers on double? {
  /// Check if double is null or zero
  bool get isNullOrZero => this == null || this == 0.0;

  /// Check if double is not null and not zero
  bool get isNotNullOrZero => !isNullOrZero;

  /// Check if double is positive (> 0)
  bool get isPositive => this != null && this! > 0;

  /// Check if double is negative (< 0)
  bool get isNegative => this != null && this! < 0;

  /// Get value or return 0.0 if null
  double get orZero => this ?? 0.0;

  /// Get value or return default if null
  double orDefault(double defaultValue) {
    return this ?? defaultValue;
  }

  /// Round to specific decimal places
  double? toDecimalPlaces(int places) {
    if (this == null) return null;
    return double.parse(this!.toStringAsFixed(places));
  }
}

/// Extension methods for bool checking
extension BoolCheckers on bool? {
  /// Check if bool is null or false
  bool get isNullOrFalse => this == null || this == false;

  /// Check if bool is true (not null and equals true)
  bool get isTrue => this ?? false;

  /// Check if bool is false (not null and equals false)
  bool get isFalse => this == false;

  /// Get value or return false if null
  bool get orFalse => this ?? false;

  /// Get value or return true if null
  bool get orTrue => this ?? true;

  /// Get value or return default if null
  bool orDefault({bool defaultValue = false}) {
    return this ?? defaultValue;
  }
}

/// Extension methods for DateTime checking
extension DateTimeCheckers on DateTime? {
  /// Check if DateTime is null
  bool get isNull => this == null;

  /// Check if DateTime is not null
  bool get isNotNull => this != null;

  /// Check if DateTime is in the past
  bool get isPast => this != null && this!.isBefore(DateTime.now());

  /// Check if DateTime is in the future
  bool get isFuture => this != null && this!.isAfter(DateTime.now());

  /// Check if DateTime is today
  bool get isToday {
    if (this == null) return false;
    final now = DateTime.now();
    return this!.year == now.year &&
        this!.month == now.month &&
        this!.day == now.day;
  }

  /// Get DateTime or return now if null
  DateTime get orNow => this ?? DateTime.now();

  /// Get DateTime or return default if null
  DateTime orDefault(DateTime defaultValue) {
    return this ?? defaultValue;
  }
}
