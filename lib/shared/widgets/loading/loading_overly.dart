import 'package:flutter/material.dart';
import 'package:groozil_app/shared/widgets/loading/loading_indicator.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black54,
      child: LoadingIndicator(message: message),
    );
  }
}
