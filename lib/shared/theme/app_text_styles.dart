import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Font weights for consistency
class AppFontWeight {
  AppFontWeight._();

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

/// Custom theme extension for all text styles
/// Naming convention: fontWeight_fontSize_lineHeight
@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    // Regular
    this.regular10_15,
    this.regular11_15,
    this.regular12_15,
    this.regular13_17,
    this.regular14_17,
    this.regular14_24,
    this.regular15_18,
    this.regular16_20,
    this.regular18_24,
    this.regular20_25,
    this.regular22_28,
    this.regular24_30,
    this.regular28_35,
    this.regular32_40,
    this.regular36_45,
    // Medium
    this.medium9_15,
    this.medium10_15,
    this.medium12_15,
    this.medium13_15,
    this.medium14_17,
    this.medium15_18,
    this.medium16_20,
    this.medium18_24,
    this.medium20_25,
    this.medium22_28,
    this.medium24_30,
    this.medium28_35,
    this.medium32_40,
    this.medium36_45,
    // SemiBold
    this.semiBold12_15,
    this.semiBold14_17,
    this.semiBold15_18,
    this.semiBold16_20,
    this.semiBold18_24,
    this.semiBold20_25,
    this.semiBold22_28,
    this.semiBold24_30,
    this.semiBold28_35,
    this.semiBold32_40,
    this.semiBold36_45,
    // Bold
    this.bold12_15,
    this.bold14_17,
    this.bold15_18,
    this.bold16_20,
    this.bold18_24,
    this.bold20_25,
    this.bold22_28,
    this.bold24_30,
    this.bold28_35,
    this.bold32_40,
    this.bold36_45,
  });

  // Regular
  final TextStyle? regular10_15;
  final TextStyle? regular11_15;
  final TextStyle? regular12_15;
  final TextStyle? regular13_17;
  final TextStyle? regular14_17;
  final TextStyle? regular14_24;
  final TextStyle? regular15_18;
  final TextStyle? regular16_20;
  final TextStyle? regular18_24;
  final TextStyle? regular20_25;
  final TextStyle? regular22_28;
  final TextStyle? regular24_30;
  final TextStyle? regular28_35;
  final TextStyle? regular32_40;
  final TextStyle? regular36_45;

  // Medium
  final TextStyle? medium9_15;
  final TextStyle? medium10_15;
  final TextStyle? medium12_15;
  final TextStyle? medium13_15;
  final TextStyle? medium14_17;
  final TextStyle? medium15_18;
  final TextStyle? medium16_20;
  final TextStyle? medium18_24;
  final TextStyle? medium20_25;
  final TextStyle? medium22_28;
  final TextStyle? medium24_30;
  final TextStyle? medium28_35;
  final TextStyle? medium32_40;
  final TextStyle? medium36_45;

  // SemiBold
  final TextStyle? semiBold12_15;
  final TextStyle? semiBold14_17;
  final TextStyle? semiBold15_18;
  final TextStyle? semiBold16_20;
  final TextStyle? semiBold18_24;
  final TextStyle? semiBold20_25;
  final TextStyle? semiBold22_28;
  final TextStyle? semiBold24_30;
  final TextStyle? semiBold28_35;
  final TextStyle? semiBold32_40;
  final TextStyle? semiBold36_45;

  // Bold
  final TextStyle? bold12_15;
  final TextStyle? bold14_17;
  final TextStyle? bold15_18;
  final TextStyle? bold16_20;
  final TextStyle? bold18_24;
  final TextStyle? bold20_25;
  final TextStyle? bold22_28;
  final TextStyle? bold24_30;
  final TextStyle? bold28_35;
  final TextStyle? bold32_40;
  final TextStyle? bold36_45;

  static AppTextStyles light = AppTextStyles(
    // Regular
    regular10_15: TextStyle(fontSize: 10.sp, fontWeight: AppFontWeight.regular, height: 1.5),
    regular11_15: TextStyle(fontSize: 11.sp, fontWeight: AppFontWeight.regular, height: 1.36),
    regular12_15: TextStyle(fontSize: 12.sp, fontWeight: AppFontWeight.regular, height: 1.25),
    regular13_17: TextStyle(fontSize: 13.sp, fontWeight: AppFontWeight.regular, height: 1.30),
    regular14_17: TextStyle(fontSize: 14.sp, fontWeight: AppFontWeight.regular, height: 1.21),
    regular14_24: TextStyle(fontSize: 14.sp, fontWeight: AppFontWeight.regular, height: 1.71),
    regular15_18: TextStyle(fontSize: 15.sp, fontWeight: AppFontWeight.regular, height: 1.2),
    regular16_20: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.regular, height: 1.25),
    regular18_24: TextStyle(fontSize: 18.sp, fontWeight: AppFontWeight.regular, height: 1.33),
    regular20_25: TextStyle(fontSize: 20.sp, fontWeight: AppFontWeight.regular, height: 1.25),
    regular22_28: TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.regular, height: 1.27),
    regular24_30: TextStyle(fontSize: 24.sp, fontWeight: AppFontWeight.regular, height: 1.25),
    regular28_35: TextStyle(fontSize: 28.sp, fontWeight: AppFontWeight.regular, height: 1.25),
    regular32_40: TextStyle(fontSize: 32.sp, fontWeight: AppFontWeight.regular, height: 1.25),
    regular36_45: TextStyle(fontSize: 36.sp, fontWeight: AppFontWeight.regular, height: 1.25),

    // Medium
    medium9_15: TextStyle(fontSize: 9.sp, fontWeight: AppFontWeight.medium, height: 1.66),
    medium10_15: TextStyle(fontSize: 10.sp, fontWeight: AppFontWeight.medium, height: 1.5),
    medium12_15: TextStyle(fontSize: 12.sp, fontWeight: AppFontWeight.medium, height: 1.25),
    medium13_15: TextStyle(fontSize: 13.sp, fontWeight: AppFontWeight.medium, height: 1.15),
    medium14_17: TextStyle(fontSize: 14.sp, fontWeight: AppFontWeight.medium, height: 1.21),
    medium15_18: TextStyle(fontSize: 15.sp, fontWeight: AppFontWeight.medium, height: 1.2),
    medium16_20: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.medium, height: 1.25),
    medium18_24: TextStyle(fontSize: 18.sp, fontWeight: AppFontWeight.medium, height: 1.33),
    medium20_25: TextStyle(fontSize: 20.sp, fontWeight: AppFontWeight.medium, height: 1.25),
    medium22_28: TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.medium, height: 1.27),
    medium24_30: TextStyle(fontSize: 24.sp, fontWeight: AppFontWeight.medium, height: 1.25),
    medium28_35: TextStyle(fontSize: 28.sp, fontWeight: AppFontWeight.medium, height: 1.25),
    medium32_40: TextStyle(fontSize: 32.sp, fontWeight: AppFontWeight.medium, height: 1.25),
    medium36_45: TextStyle(fontSize: 36.sp, fontWeight: AppFontWeight.medium, height: 1.25),

    // SemiBold
    semiBold12_15: TextStyle(fontSize: 12.sp, fontWeight: AppFontWeight.semiBold, height: 1.25),
    semiBold14_17: TextStyle(fontSize: 14.sp, fontWeight: AppFontWeight.semiBold, height: 1.21),
    semiBold15_18: TextStyle(fontSize: 15.sp, fontWeight: AppFontWeight.semiBold, height: 1.2),
    semiBold16_20: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.semiBold, height: 1.25),
    semiBold18_24: TextStyle(fontSize: 18.sp, fontWeight: AppFontWeight.semiBold, height: 1.33),
    semiBold20_25: TextStyle(fontSize: 20.sp, fontWeight: AppFontWeight.semiBold, height: 1.25),
    semiBold22_28: TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.semiBold, height: 1.27),
    semiBold24_30: TextStyle(fontSize: 24.sp, fontWeight: AppFontWeight.semiBold, height: 1.25),
    semiBold28_35: TextStyle(fontSize: 28.sp, fontWeight: AppFontWeight.semiBold, height: 1.25),
    semiBold32_40: TextStyle(fontSize: 32.sp, fontWeight: AppFontWeight.semiBold, height: 1.25),
    semiBold36_45: TextStyle(fontSize: 36.sp, fontWeight: AppFontWeight.semiBold, height: 1.25),

    // Bold
    bold12_15: TextStyle(fontSize: 12.sp, fontWeight: AppFontWeight.bold, height: 1.25),
    bold14_17: TextStyle(fontSize: 14.sp, fontWeight: AppFontWeight.bold, height: 1.21),
    bold15_18: TextStyle(fontSize: 15.sp, fontWeight: AppFontWeight.bold, height: 1.2),
    bold16_20: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.bold, height: 1.25),
    bold18_24: TextStyle(fontSize: 18.sp, fontWeight: AppFontWeight.bold, height: 1.33),
    bold20_25: TextStyle(fontSize: 20.sp, fontWeight: AppFontWeight.bold, height: 1.25),
    bold22_28: TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.bold, height: 1.27),
    bold24_30: TextStyle(fontSize: 24.sp, fontWeight: AppFontWeight.bold, height: 1.25),
    bold28_35: TextStyle(fontSize: 28.sp, fontWeight: AppFontWeight.bold, height: 1.25),
    bold32_40: TextStyle(fontSize: 32.sp, fontWeight: AppFontWeight.bold, height: 1.25),
    bold36_45: TextStyle(fontSize: 36.sp, fontWeight: AppFontWeight.bold, height: 1.25),
  );

  @override
  ThemeExtension<AppTextStyles> copyWith() => this;

  @override
  ThemeExtension<AppTextStyles> lerp(
      covariant ThemeExtension<AppTextStyles>? other,
      double t,
      ) {
    return this;
  }
}