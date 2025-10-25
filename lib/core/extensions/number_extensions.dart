import 'package:groozil_app/core/constants/app_constants.dart';

extension DoubleExtensions on double {
  /// Format as price
  String toPrice() {
    return '${AppConstants.currencySymbol} ${toStringAsFixed(2)}';
  }
}

extension IntExtensions on int {
  /// Format as price
  String toPrice() {
    return '${AppConstants.currencySymbol} ${toStringAsFixed(2)}';
  }
}
