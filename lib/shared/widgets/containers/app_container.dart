import 'package:flutter/material.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';

class AppContainer extends StatelessWidget {

  const AppContainer({
    super.key,
    this.height = 40,
    this.width = 40,
    this.padding,
    this.borderRadius = 40,
    this.color,
    this.onTap,
    this.child,
    this.boxShadow,
  });
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Color? color;
  final VoidCallback? onTap;
  final Widget? child;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: height,
        width: width,
        padding: padding ?? 10.padAll,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: borderRadius.rBox,
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
