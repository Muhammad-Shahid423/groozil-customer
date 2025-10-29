import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/widgets/toast/app_toast.dart';
import 'package:groozil_app/shared/widgets/toast/toast_request.dart';

class ToastOverlay extends StatefulWidget {

  const ToastOverlay({required this.request, required this.onClosed, super.key});
  final ToastRequest request;
  final VoidCallback onClosed;

  @override
  State<ToastOverlay> createState() => ToastOverlayState();
}

class ToastOverlayState extends State<ToastOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ac;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;
  Timer? _timer;

  Color get _bg => widget.request.backgroundColor ?? _defaultBg(widget.request.type, context);
  Color get _fg => widget.request.foregroundColor ?? Colors.white;
  IconData get _icon => widget.request.icon ?? _defaultIcon(widget.request.type);

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(vsync: this, duration: const Duration(milliseconds: 220));
    final begin = widget.request.position == ToastPosition.top
        ? const Offset(0, -0.2)
        : const Offset(0, 0.2);
    _slide = Tween<Offset>(begin: begin, end: Offset.zero)
        .animate(CurvedAnimation(parent: _ac, curve: Curves.easeOutCubic));
    _fade = CurvedAnimation(parent: _ac, curve: Curves.easeOut);

    _ac.forward();
    _timer = Timer(widget.request.duration, _close);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ac.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    if (!_ac.isDismissed) {
      await _ac.reverse();
    }
    if (mounted) widget.onClosed();
  }

  @override
  Widget build(BuildContext context) {
    final safe = MediaQuery.of(context).padding;
    final margin = widget.request.margin +
        EdgeInsets.only(
          top: widget.request.position == ToastPosition.top ? safe.top : 0,
          bottom: widget.request.position == ToastPosition.bottom ? safe.bottom : 0,
        );

    final aligned = widget.request.position == ToastPosition.top
        ? Alignment.topCenter
        : Alignment.bottomCenter;

    return IgnorePointer(
      ignoring: false, // allow taps to dismiss
      child: SafeArea(
        child: Container(
          alignment: aligned,
          margin: margin,
          child: SlideTransition(
            position: _slide,
            child: FadeTransition(
              opacity: _fade,
              child: Dismissible(
                key: const ValueKey('app_toast'),
                direction: widget.request.position == ToastPosition.top
                    ? DismissDirection.up
                    : DismissDirection.down,
                onDismissed: (_) => _close(),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      widget.request.onTap?.call();
                      await _close();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 700),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: _bg,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.18),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_icon, color: _fg),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              widget.request.message,
                              maxLines: widget.request.maxLines,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: _fg,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Color _defaultBg(ToastType type, BuildContext ctx) {
    final scheme = Theme.of(ctx).colorScheme;
    switch (type) {
      case ToastType.success:
        return AppColors.success;
      case ToastType.error:
        return AppColors.error;
      case ToastType.warning:
        return AppColors.warning;
      case ToastType.info:
        return scheme.inverseSurface.withOpacity(.92);
    }
  }

  static IconData _defaultIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Icons.check_circle_rounded;
      case ToastType.error:
        return Icons.error_rounded;
      case ToastType.warning:
        return Icons.warning_rounded;
      case ToastType.info:
        return Icons.info_rounded;
    }
  }
}
