import 'package:groozil_app/core/constants/app_constants.dart';

extension StringExtensions on String {
  /// Capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalize each word
  String capitalizeWords() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Check if string is email
  bool get isEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Check if string is phone number
  bool get isPhoneNumber {
    final cleanPhone = replaceAll(RegExp(r'[^\d]'), '');
    return cleanPhone.length == AppConstants.phoneNumberLength &&
        cleanPhone.startsWith('05');
  }

  /// Format price
  String formatPrice() {
    return '${AppConstants.currencySymbol} $this';
  }

  /// Truncate string
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}
