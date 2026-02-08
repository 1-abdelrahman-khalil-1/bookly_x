import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

// ignore: avoid_classes_with_only_static_members
class AppBoxDecoration {
  static final defaultDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: AppColors.boxShadow.withValues(alpha: .04),
        spreadRadius: 3,
        blurRadius: 4,
      ),
    ],
  );
}
