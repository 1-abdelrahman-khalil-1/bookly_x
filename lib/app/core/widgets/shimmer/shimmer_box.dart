import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/app_colors.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerBox({
    super.key,
    this.height = 10,
    this.width,
    this.borderRadius,
    this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.primaryLight,
      highlightColor: highlightColor ?? const Color(0xfff0f6f8),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderRadius ??
              BorderRadius.circular(height > 24 ? 8 : height / 4),
        ),
        child: child,
      ),
    );
  }
}

class ShimmerChild extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadius? borderRadius;
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerChild({
    required this.child,
    super.key,
    this.height = 8,
    this.width,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.primaryLight,
      highlightColor: highlightColor ?? const Color(0xfff0f6f8),
      child: child,
    );
  }
}

class ShimmerText extends ShimmerBox {
  const ShimmerText({
    super.key,
    super.height = 18,
    super.width,
    super.borderRadius,
    super.child,
    super.baseColor,
    super.highlightColor,
  });
}
