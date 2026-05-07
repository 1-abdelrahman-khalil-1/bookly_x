import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookingCardShimmer extends StatelessWidget {
  const BookingCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = AppColors.primaryLightHover;
    final highlightColor = Colors.white.withValues(alpha: 0.6);

    final screenWidth = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.textBorders),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            /// left accent
            Container(
              width: 4,
              height: 140, // مهم عشان stretch
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// content
            Container(
              width: screenWidth - 60,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// top row
                  Row(
                    children: [
                      shimmerBox(width: 70, height: 24, radius: 999),
                      const Spacer(),
                      Row(
                        children: [
                          shimmerBox(width: 16, height: 16, radius: 4),
                          const SizedBox(width: 4),
                          shimmerBox(width: 50, height: 10),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  /// name (long)
                  shimmerBox(
                    width: screenWidth * 0.6,
                    height: 16,
                  ),

                  const SizedBox(height: 6),

                  /// service
                  Row(
                    children: [
                      shimmerBox(width: 16, height: 16, radius: 4),
                      const SizedBox(width: 6),
                      shimmerBox(
                        width: screenWidth * 0.4,
                        height: 12,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// button
                  shimmerBox(
                    width: double.infinity,
                    height: 42,
                    radius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shimmerBox({
    double? width,
    double? height,
    double radius = 6,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryLightHover,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
