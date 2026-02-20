import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ClientHomeShimmer extends StatelessWidget {
  const ClientHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.h,
          const OffersShimmer(),
          24.h,
          const CategoriesShimmer(),
          24.h,
          const ProvidersShimmer(),
          24.h,
        ],
      ),
    );
  }
}

class OffersShimmer extends StatelessWidget {
  const OffersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, index) => 24.w,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 18, width: 100, color: Colors.white),
            16.h,
            Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: index < 2 ? 6 : 0),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProvidersShimmer extends StatelessWidget {
  const ProvidersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 18, width: 150, color: Colors.white),
                Container(height: 14, width: 60, color: Colors.white),
              ],
            ),
          ),
          8.h,
          SizedBox(
            height: 360,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              separatorBuilder: (context, index) => 8.w,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5 -
                      8 -
                      12, // approx
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
