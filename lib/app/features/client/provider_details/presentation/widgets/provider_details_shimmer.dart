import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProviderDetailsShimmer extends StatelessWidget {
  const ProviderDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header placeholder ───────────────────────────────────────
            Container(height: 300, color: Colors.white),

            // ── White card ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service name + rating row
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 24, color: Colors.white),
                      ),
                      16.w,
                      Container(height: 24, width: 80, color: Colors.white),
                    ],
                  ),
                  20.h,

                  // Seller section
                  Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      12.w,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 16, width: 120, color: Colors.white),
                            8.h,
                            Container(
                                height: 12, width: 90, color: Colors.white),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      8.w,
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ],
                  ),
                  20.h,

                  // Description lines
                  Container(height: 14, color: Colors.white),
                  8.h,
                  Container(height: 14, color: Colors.white),
                  8.h,
                  Container(height: 14, width: 200, color: Colors.white),
                  24.h,

                  // Divider
                  Container(height: 1, color: Colors.white),
                  24.h,

                  // Available services title
                  Container(height: 18, width: 140, color: Colors.white),
                  16.h,

                  // Services horizontal list
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (_, __) => 8.w,
                      itemBuilder: (_, __) => Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  24.h,

                  // Reviews title
                  Container(height: 18, width: 120, color: Colors.white),
                  16.h,

                  // Review cards
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      separatorBuilder: (_, __) => 12.w,
                      itemBuilder: (_, __) => Container(
                        width: 243,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
