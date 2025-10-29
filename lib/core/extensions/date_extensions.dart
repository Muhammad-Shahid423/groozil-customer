import 'package:groozil_app/core/constants/app_constants.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Format to date string
  String toDateString() {
    return DateFormat(AppConstants.dateFormat).format(this);
  }

  /// Format to time string
  String toTimeString() {
    return DateFormat(AppConstants.timeFormat).format(this);
  }

  /// Format to date-time string
  String toDateTimeString() {
    return DateFormat(AppConstants.dateTimeFormat).format(this);
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Get time ago string
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
