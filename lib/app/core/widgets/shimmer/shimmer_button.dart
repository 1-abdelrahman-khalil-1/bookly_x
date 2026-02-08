import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/app_colors.dart';

class ShimmerButton extends StatelessWidget {
  final double? borderRadius;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const ShimmerButton({
    super.key,
    this.borderRadius,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.textBorders,
      highlightColor: const Color(0xfff0f6f8),
      child: GestureDetector(
        onTap: onPressed ?? () => {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          width: width ?? 220,
          height: height ?? 48,
        ),
      ),
    );
  }
}
