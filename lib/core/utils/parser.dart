/// Utility class for safe data parsing and conversion
class Parser {
  Parser._(); // Private constructor to prevent instantiation

  // ==================== String Parsing ====================

  /// Safely parse to int, returns default value if parsing fails
  static int toInt(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  /// Safely parse to int or return null if parsing fails
  static int? toIntOrNull(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  /// Safely parse to double, returns default value if parsing fails
  static double toDouble(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  /// Safely parse to double or return null if parsing fails
  static double? toDoubleOrNull(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  /// Safely parse to num, returns default value if parsing fails
  static num toNum(dynamic value, {num defaultValue = 0}) {
    if (value == null) return defaultValue;
    if (value is num) return value;
    if (value is String) {
      return double.tryParse(value) ?? int.tryParse(value) ?? defaultValue;
    }
    return defaultValue;
  }

  /// Safely parse to num or return null if parsing fails
  static num? toNumOrNull(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    if (value is String) {
      return double.tryParse(value) ?? int.tryParse(value);
    }
    return null;
  }

  /// Safely parse to bool, returns default value if parsing fails
  /// Accepts: 'true', '1', 'yes', true as true
  /// Accepts: 'false', '0', 'no', false as false
  static bool toBool(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) {
      final lower = value.toLowerCase().trim();
      if (lower == 'true' || lower == '1' || lower == 'yes') return true;
      if (lower == 'false' || lower == '0' || lower == 'no') return false;
    }
    return defaultValue;
  }

  /// Safely parse to bool or return null if parsing fails
  static bool? toBoolOrNull(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) {
      final lower = value.toLowerCase().trim();
      if (lower == 'true' || lower == '1' || lower == 'yes') return true;
      if (lower == 'false' || lower == '0' || lower == 'no') return false;
    }
    return null;
  }

  /// Safely parse to String, returns default value if null
  static String toStr(dynamic value, {String defaultValue = ''}) {
    if (value == null) return defaultValue;
    return value.toString();
  }

  /// Safely parse to String or return null
  static String? toStrOrNull(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }

  // ==================== DateTime Parsing ====================

  /// Safely parse to DateTime, returns default value if parsing fails
  static DateTime toDateTime(
    dynamic value, {
    DateTime? defaultValue,
  }) {
    defaultValue ??= DateTime.now();
    if (value == null) return defaultValue;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value) ?? defaultValue;
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    }
    return defaultValue;
  }

  /// Safely parse to DateTime or return null if parsing fails
  static DateTime? toDateTimeOrNull(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    return null;
  }

  // ==================== List Parsing ====================

  /// Safely convert to List<String>
  static List<String> toStringList(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value.map((e) => e?.toString() ?? '').toList();
    }
    return [];
  }

  /// Safely convert to List<int>
  static List<int> toIntList(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value
          .map((e) => toIntOrNull(e))
          .where((e) => e != null)
          .cast<int>()
          .toList();
    }
    return [];
  }

  /// Safely convert to List<double>
  static List<double> toDoubleList(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value
          .map((e) => toDoubleOrNull(e))
          .where((e) => e != null)
          .cast<double>()
          .toList();
    }
    return [];
  }

  // ==================== Map Parsing ====================

  /// Safely convert to Map<String, dynamic>
  static Map<String, dynamic> toMap(dynamic value) {
    if (value == null) return {};
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return {};
  }

  // ==================== Number Formatting ====================

  /// Format number to string with specific decimal places
  static String toDecimalString(num? value, {int decimalPlaces = 2}) {
    if (value == null) return '0.00';
    return value.toStringAsFixed(decimalPlaces);
  }

  /// Format number as currency (with optional symbol)
  static String toCurrency(
    num? value, {
    String symbol = '\$',
    int decimalPlaces = 2,
  }) {
    if (value == null) return '$symbol 0.00';
    final formatted = value.toStringAsFixed(decimalPlaces);
    return '$symbol $formatted';
  }

  /// Format number with thousand separators
  static String toFormattedNumber(num? value) {
    if (value == null) return '0';
    final parts = value.toString().split('.');
    final intPart = parts[0];
    final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';
    
    final formatted = intPart.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    
    return formatted + decimalPart;
  }

  // ==================== Percentage ====================

  /// Convert decimal to percentage string (0.5 -> "50%")
  static String toPercentage(num? value, {int decimalPlaces = 0}) {
    if (value == null) return '0%';
    final percentage = value * 100;
    return '${percentage.toStringAsFixed(decimalPlaces)}%';
  }

  // ==================== Phone Number ====================

  /// Format phone number (e.g., +966501234567 -> +966 50 123 4567)
  static String formatPhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) return '';
    
    // Remove all non-digit characters except +
    final cleaned = phone.replaceAll(RegExp(r'[^\d+]'), '');
    
    // Saudi phone format: +966 50 123 4567
    if (cleaned.startsWith('+966') && cleaned.length == 13) {
      return '${cleaned.substring(0, 4)} ${cleaned.substring(4, 6)} ${cleaned.substring(6, 9)} ${cleaned.substring(9)}';
    }
    
    return cleaned;
  }

  // ==================== Default Value Helpers ====================

  /// Get value or default
  static T valueOrDefault<T>(T? value, T defaultValue) {
    return value ?? defaultValue;
  }

  /// Get first non-null value from list of values
  static T? firstNonNull<T>(List<T?> values) {
    for (final value in values) {
      if (value != null) return value;
    }
    return null;
  }
}
