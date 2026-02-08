import 'package:flutter/material.dart';

extension ScrollExtension on ScrollController {
  void animateToFirstPosition({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
  }) =>
      animateTo(
        position.minScrollExtent,
        duration: duration,
        curve: Curves.easeOut,
      );
}
