import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppAnimation extends StatelessWidget {

  const AppAnimation({
    required this.assetPath,
    super.key,
    this.width,
    this.height,
    this.repeat = true,
    this.animate = true,
    this.fit = BoxFit.contain,
  });
  final String assetPath;
  final double? width;
  final double? height;
  final bool repeat;
  final bool animate;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetPath,
      width: width?.w,
      height: height?.h,
      repeat: repeat,
      animate: animate,
      fit: fit,
    );
  }
}
