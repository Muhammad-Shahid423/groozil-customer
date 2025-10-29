import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groozil_app/shared/widgets/toast/toast_overlay.dart';
import 'package:groozil_app/shared/widgets/toast/toast_request.dart';

enum ToastType { info, success, error, warning }
enum ToastPosition { top, bottom }

class AppToast {
  AppToast._();

  static final _queue = Queue<ToastRequest>();
  static bool _isShowing = false;

  /// Public API
  static Future<void> show(
      BuildContext context, {
        required String message,
        ToastType type = ToastType.info,
        Duration duration = const Duration(seconds: 3),
        ToastPosition position = ToastPosition.top,
        EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        IconData? icon,
        Color? backgroundColor,
        Color? foregroundColor,
        bool haptic = true,
        VoidCallback? onTap,
        int maxLines = 3,
      }) async {
    _queue.add(ToastRequest(
      context: context,
      message: message,
      type: type,
      duration: duration,
      position: position,
      margin: margin,
      icon: icon,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      haptic: haptic,
      onTap: onTap,
      maxLines: maxLines,
    ));
    if (!_isShowing) {
      await _displayNext();
    }
  }

  static Future<void> _displayNext() async {
    if (_queue.isEmpty) return;
    _isShowing = true;

    final req = _queue.removeFirst();
    final overlay = Overlay.maybeOf(req.context) ??
        Navigator.of(req.context, rootNavigator: true).overlay;

    if (overlay == null) {
      _isShowing = false;
      await _displayNext();
      return;
    }

    if (req.haptic) await HapticFeedback.lightImpact();

    OverlayEntry? entry;
    entry = OverlayEntry(
      builder: (ctx) => ToastOverlay(
        request: req,
        onClosed: () {
          entry?.remove();
          _isShowing = false;
          Future.delayed(const Duration(milliseconds: 120), _displayNext);
        },
      ),
    );

    overlay.insert(entry);
  }
}
