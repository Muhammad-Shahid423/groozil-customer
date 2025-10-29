import 'package:flutter/material.dart';
import 'package:groozil_app/shared/widgets/toast/app_toast.dart';

class ToastRequest {
  ToastRequest({
    required this.context,
    required this.message,
    required this.type,
    required this.duration,
    required this.position,
    required this.margin,
    required this.haptic, required this.maxLines, this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.onTap,
  });

  final BuildContext context;
  final String message;
  final ToastType type;
  final Duration duration;
  final ToastPosition position;
  final EdgeInsets margin;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool haptic;
  final VoidCallback? onTap;
  final int maxLines;
}
