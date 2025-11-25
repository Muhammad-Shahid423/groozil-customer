import 'package:flutter/material.dart';

class AppColors {
  // Prevent instantiation
  AppColors._();

  // ============================================
  // PRIMARY COLORS (Orange/Brown tones)
  // ============================================
  static const Color primary50 = Color(0xFFfef0ee);
  static const Color primary100 = Color(0xFFfcc0b3);
  static const Color primary200 = Color(0xFFfab98e);
  static const Color primary300 = Color(0xFFf6985a);
  static const Color primary400 = Color(0xFFf58523);
  static const Color primary500 = Color(0xFFd46609);
  static const Color primary600 = Color(0xFFa6450d);
  static const Color primary700 = Color(0xFF9d4806);
  static const Color primary800 = Color(0xFF893805);
  static const Color primary900 = Color(0xFF67260d);

  static const Color primary = primary500;
  static const Color primaryDark = primary700;
  static const Color primaryLight = primary200;

  // ============================================
  // SECONDARY COLORS (Yellow tones)
  // ============================================
  static const Color secondary50 = Color(0xFFfff9ed);
  static const Color secondary100 = Color(0xFFfeebe1);
  static const Color secondary200 = Color(0xFFfde280);
  static const Color secondary300 = Color(0xFFfcd955);
  static const Color secondary400 = Color(0xFFfccd35);
  static const Color secondary500 = Color(0xFFfcc002);
  static const Color secondary600 = Color(0xFFe4af02);
  static const Color secondary700 = Color(0xFF9d8801);
  static const Color secondary800 = Color(0xFF8a6a01);
  static const Color secondary900 = Color(0xFF875101);

  static const Color secondary = secondary500;
  static const Color secondaryDark = secondary700;
  static const Color secondaryLight = secondary200;

  // ============================================
  // SUCCESS COLORS (Green tones)
  // ============================================
  static const Color success50 = Color(0xFFe8f9ee);
  static const Color success100 = Color(0xFF8b7e6c);
  static const Color success200 = Color(0xFF94a550);
  static const Color success300 = Color(0xFF8f409c);
  static const Color success400 = Color(0xFF45c075);
  static const Color success500 = Color(0xFF17c853);
  static const Color success600 = Color(0xFF19b44c);
  static const Color success700 = Color(0xFF10883b);
  static const Color success800 = Color(0xFF066b2e);
  static const Color success900 = Color(0xFF0a5323);

  static const Color success = success500;
  static const Color successDark = success700;
  static const Color successLight = success200;

  // ============================================
  // WARNING COLORS (Yellow/Gold tones)
  // ============================================
  static const Color warning50 = Color(0xFFfff9e8);
  static const Color warning100 = Color(0xFFfff5c9);
  static const Color warning200 = Color(0xFFfee89e);
  static const Color warning300 = Color(0xFFfcde71);
  static const Color warning400 = Color(0xFFf9d454);
  static const Color warning500 = Color(0xFFfcc839);
  static const Color warning600 = Color(0xFFd8a629);
  static const Color warning700 = Color(0xFF9b6710);
  static const Color warning800 = Color(0xFF8c4143);
  static const Color warning900 = Color(0xFF7d5811);

  static const Color warning = warning500;
  static const Color warningDark = warning700;
  static const Color warningLight = warning200;

  // ============================================
  // DANGER/ERROR COLORS (Red tones)
  // ============================================
  static const Color danger50 = Color(0xFFffeae7);
  static const Color danger100 = Color(0xFFffc5bd);
  static const Color danger200 = Color(0xFFffa090);
  static const Color danger300 = Color(0xFFff7a5e);
  static const Color danger400 = Color(0xFFff5e3d);
  static const Color danger500 = Color(0xFFff3b0e);
  static const Color danger600 = Color(0xFFe6360d);
  static const Color danger700 = Color(0xFFb42a0a);
  static const Color danger800 = Color(0xFF8c2008);
  static const Color danger900 = Color(0xFF6b1806);

  static const Color error = danger500;
  static const Color errorDark = danger700;
  static const Color errorLight = danger200;
  static const Color danger = danger500;

  // ============================================
  // TYPOGRAPHY/TEXT COLORS (Gray/Black tones)
  // ============================================
  static const Color typography50 = Color(0xFFfafafa);
  static const Color typography100 = Color(0xFFe4e4e4);
  static const Color typography200 = Color(0xFFc9c9c9);
  static const Color typography300 = Color(0xFFa2a2a2);
  static const Color typography400 = Color(0xFF626262);
  static const Color typography500 = Color(0xFF404040);
  static const Color typography600 = Color(0xFF202020);
  static const Color typography700 = Color(0xFF141414);
  static const Color typography800 = Color(0xFF080808);
  static const Color typography900 = Color(0xFF060606);

  static const Color textPrimary = typography500;
  static const Color textSecondary = typography300;
  static const Color textHint = typography200;
  static const Color textDisabled = typography100;
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = typography500;
  static const Color textDark = Color(0xFF2D3648);

  // ============================================
  // BACKGROUND COLORS
  // ============================================
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundCream = Color(0xFFF5E6D3);
  static const Color backgroundGray = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  // ============================================
  // BORDER & DIVIDER COLORS
  // ============================================
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFE0E0E0);
  static const Color outline = Color(0xFFBDBDBD);

  // ============================================
  // DELIVERY STATUS COLORS
  // ============================================
  static const Color statusPending = warning500;
  static const Color statusConfirmed = Color(0xFF2196F3);
  static const Color statusPreparing = primary500;
  static const Color statusInTransit = Color(0xFF26C6DA);
  static const Color statusDelivered = success500;
  static const Color statusCancelled = danger500;

  // ============================================
  // ADDITIONAL UI COLORS
  // ============================================
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
  static const Color overlay = Color(0x80000000);
  static const Color shadow = Color(0x1A000000);

  // ============================================
  // RATING COLORS
  // ============================================
  static const Color ratingActive = secondary500;
  static const Color ratingInactive = Color(0xFFE0E0E0);

  // ============================================
  // DISCOUNT/SALE COLORS
  // ============================================
  static const Color discount = danger500;
  static const Color discountLight = danger100;

  static const Color disabled = Color(0xFFE0E0E0);

  // ============================================
  // GRADIENT DEFINITIONS
  // ============================================
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary400, primary600],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary400, secondary600],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============================================
  // HELPER METHODS
  // ============================================
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return statusPending;
      case 'confirmed':
        return statusConfirmed;
      case 'preparing':
        return statusPreparing;
      case 'in_transit':
        return statusInTransit;
      case 'delivered':
        return statusDelivered;
      case 'cancelled':
        return statusCancelled;
      default:
        return typography300;
    }
  }
}
