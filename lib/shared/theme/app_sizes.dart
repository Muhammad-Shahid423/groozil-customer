import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  AppSizes._();

  // Padding & Margins
  static double get paddingXS => 4.w;
  static double get paddingS => 8.w;
  static double get paddingM => 12.w;
  static double get paddingL => 16.w;
  static double get paddingXL => 20.w;
  static double get paddingXXL => 24.w;
  static double get paddingXXXL => 32.w;

  // Border Radius
  static double get radiusXS => 4.r;
  static double get radiusS => 8.r;
  static double get radiusM => 12.r;
  static double get radiusL => 16.r;
  static double get radiusXL => 20.r;
  static double get radiusXXL => 24.r;
  static double get radiusBottomSheet => 40.r;
  static double get radiusCircle => 999.r;

  // Icon Sizes
  static double get iconXS => 16.sp;
  static double get iconS => 20.sp;
  static double get iconM => 24.sp;
  static double get iconL => 32.sp;
  static double get iconXL => 40.sp;
  static double get iconXXL => 48.sp;

  // Button Heights
  static double get buttonHeightS => 40.h;
  static double get buttonHeightM => 48.h;
  static double get buttonHeightL => 56.h;

  // AppBar Height
  static double get appBarHeight => 56.h;

  // Bottom Navigation Height
  static double get bottomNavHeight => 70.h;

  // Card Elevation
  static const double cardElevation = 2;
  static const double cardElevationHover = 8;

  // Image Sizes
  static double get imageS => 60.w;
  static double get imageM => 80.w;
  static double get imageL => 100.w;
  static double get imageXL => 120.w;

  // Divider
  static const double dividerThickness = 1;

  // Animation Duration
  static const Duration animationShort = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationLong = Duration(milliseconds: 500);

  // Spacing
  static double get spaceXS => 4.h;
  static double get spaceS => 8.h;
  static double get spaceM => 12.h;
  static double get spaceL => 16.h;
  static double get spaceXL => 20.h;
  static double get spaceXXL => 24.h;
  static double get spaceXXXL => 32.h;
}