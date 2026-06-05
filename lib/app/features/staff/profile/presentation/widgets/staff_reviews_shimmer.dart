import 'package:bookly_x/app/core/widgets/shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';

class StaffReviewsShimmer extends StatelessWidget {
  const StaffReviewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: List.generate(
        6,
        (index) => const ShimmerBox(
          width: double.infinity,
          height: 116,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
