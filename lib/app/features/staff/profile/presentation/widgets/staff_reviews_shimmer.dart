import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/shimmer/shimmer_box.dart';
import 'package:flutter/material.dart';

class StaffReviewsShimmer extends StatelessWidget {
  const StaffReviewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (_, __) => 12.h,
      itemBuilder: (_, __) {
        return const ShimmerBox(
          width: double.infinity,
          height: 116,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        );
      },
    );
  }
}
